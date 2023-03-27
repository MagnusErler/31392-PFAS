import numpy as np
import cv2 as cv2

# Params
MATCH_NUM = 400
IMG_PATH = './data/visual_odometry'
K = np.array([[7.188560e+02, 0.000000e+00, 6.071928e+02], [0, 7.188560e+02, 1.852157e+02], [0, 0, 1]])
BASELINE = 0.54
SHOW_IMG = True
# Specify img range(check dir)
IMG_START = 400
IMG_END = 451

def extract_keypoints_surf(img1, img2, K, baseline):
    """
    use surf to detect keypoint features
    remember to include a Lowes ratio test
    """
    surf = cv2.SIFT_create()
    kp1, des1 = surf.detectAndCompute(img1,None)
    kp2, des2 = surf.detectAndCompute(img2,None)
    
    matcher = cv2.DescriptorMatcher_create(cv2.DescriptorMatcher_FLANNBASED)
    knn_matches = matcher.knnMatch(des1, des2, 2)
    
    
    # Filter matches using the Lowe's ratio test
    ratio_thresh = 0.7
    good_matches = []
    for m,n in knn_matches:
        if m.distance < ratio_thresh * n.distance:
            good_matches.append(m)
            
    good_matches = sorted(good_matches, key = lambda x:x.distance)
    good_matches = good_matches[:MATCH_NUM]
    
    matchesTrainIdx = [x.trainIdx  for x in good_matches]
    matchesQueryIdx = [x.queryIdx  for x in good_matches]
   
    match_points1 = [kp1[i].pt for i in matchesQueryIdx]
    match_points2 = [kp2[i].pt for i in matchesTrainIdx]
    
    p1 = np.float32(np.array(match_points1))
    p2 = np.float32(np.array(match_points2))

    #project the feature points to 3D with triangulation
    
    M_left = K.dot(np.hstack((np.eye(3), np.zeros((3, 1)))))
    M_rght = K.dot(np.hstack((np.eye(3), np.array([[-baseline, 0, 0]]).T)))

    p1_flip = np.vstack((p1.T, np.ones((1, p1.shape[0]))))
    p2_flip = np.vstack((p2.T, np.ones((1, p2.shape[0]))))

    P = cv2.triangulatePoints(M_left, M_rght, p1_flip[:2], p2_flip[:2])

    # Normalize homogeneous coordinates (P->Nx4  [N,4] is the normalizer/scale)
    P = P / P[3]
    land_points = P[:3]

    return land_points.T, p1

def featureTracking(prev_img, next_img, prev_points, world_points):
    """
    Use OpenCV to find the prev_points from the prev_img in the next_img
    Remember to remove points that could not be found from prev_points, next_points, and world_points
    """
    params = dict(winSize=(21, 21),
                 maxLevel=3,
                 criteria=(cv2.TERM_CRITERIA_EPS | cv2.TERM_CRITERIA_COUNT, 30, 0.01))
    
    
    next_points, status, _ = cv2.calcOpticalFlowPyrLK(prev_img, next_img, prev_points, nextPts=None, \
                                                      winSize=params["winSize"], maxLevel=params["maxLevel"], criteria=params["criteria"])
    
    next_points = np.squeeze(next_points[np.where(status[:,0]==1),:])
    prev_points = np.squeeze(prev_points[np.where(status[:,0]==1),:])
    world_points = np.squeeze(world_points[np.where(status[:,0]==1),:])
    
    return world_points, prev_points, next_points

def get_image(path, index):
    return cv2.imread(f'{path}/{index:010d}.png')

if __name__ == '__main__':
    left_img = get_image(f"{IMG_PATH}/left", IMG_START)
    right_img = get_image(f"{IMG_PATH}/right", IMG_START)

    # Get 3D points Using Triangulation
    landmark_3D, reference_2D = extract_keypoints_surf(left_img, right_img, K, BASELINE)
    
    # reference
    prev_img = left_img
    traj = np.zeros((left_img.shape[0]//2, 300, 3), dtype=np.uint8)
    for i in range(IMG_START, IMG_END):
        curImage = get_image(f"{IMG_PATH}/left", i)
        curImage_R = get_image(f"{IMG_PATH}/right", i)

        # the 2D landmarks at the current time = t
        landmark_3D, reference_2D, tracked_2Dpoints = featureTracking(prev_img, 
                                                                      curImage, 
                                                                      reference_2D,
                                                                      landmark_3D)

        #Calculate relative pose using PNP
        _, rvec, tvec, _ = cv2.solvePnPRansac(landmark_3D,tracked_2Dpoints,K, None)
    
        rot, _ = cv2.Rodrigues(rvec)
        tvec = -rot.T.dot(tvec)  # coordinate transformation, from camera to world. What is the XYZ of the camera wrt World
        inv_transform = np.hstack((rot.T, tvec))  # inverse transform. A tranform projecting points from the camera frame to the world frame

        # re-obtain the 3D points
        landmark_3D_new, reference_2D_new = extract_keypoints_surf(curImage, curImage_R, K, BASELINE)
        
        #Project the points from camera to world coordinates
        reference_2D = reference_2D_new.astype('float32')
        landmark_3D = inv_transform.dot(np.vstack((landmark_3D_new.T, np.ones((1, landmark_3D_new.shape[0])))))
        landmark_3D = landmark_3D.T

        prev_img = curImage

        # draw images
        draw_x, draw_y = int(tvec[0]) + 150, (left_img.shape[0]//2)-(int(tvec[2]) + 50);

        print(f"\nImage: {i}\nPosition: {tvec.squeeze()}\nRotation: {rvec.squeeze()}")
        
        if SHOW_IMG:
            text = "Coordinates:\n x ={0:02f}m\n y = {1:02f}m\n z = {2:02f}m".format(float(tvec[0]), float(tvec[1]),
                                                                            float(tvec[2]))
            text = text.split('\n')
            text_frame = np.zeros((left_img.shape[0]//2, 300, 3), dtype=np.uint8);
            cv2.circle(traj, (draw_x, draw_y), 1, (0, 0, 255), 2)
            cv2.putText(text_frame, text[0], (10, 30), cv2.FONT_HERSHEY_PLAIN, 1, (255, 255, 255), 1, 8)
            cv2.putText(text_frame, text[1], (10, 60), cv2.FONT_HERSHEY_PLAIN, 1, (255, 255, 255), 1, 8)
            cv2.putText(text_frame, text[2], (10, 90), cv2.FONT_HERSHEY_PLAIN, 1, (255, 255, 255), 1, 8)
            cv2.putText(text_frame, text[3], (10, 120), cv2.FONT_HERSHEY_PLAIN, 1, (255, 255, 255), 1, 8)
            
            vis = np.vstack((text_frame, traj))
            vis = np.hstack((curImage, vis))
            
            cv2.imshow("Trajectory", vis)
            k = cv2.waitKey(1) & 0xFF
            if k == 27: break
    print(f"\n\n======= Results ======= \nPosition: {tvec.squeeze()}\nRotation: {rvec.squeeze()}")
    cv2.destroyAllWindows()