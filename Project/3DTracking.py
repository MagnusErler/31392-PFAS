
import cv2
import glob
import re
import os
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# IMPORTING DATA
def importLabels():
    print("Importing labels...")
    label_path = "seq_02/labels.txt"
    labels = np.loadtxt(label_path, delimiter=' ', dtype=str, usecols=range(15))

    frame = labels[:,0].astype(int)
    track_id = labels[:,1].astype(int)
    type = labels[:,2]
    truncated = labels[:,3].astype(float)
    occluded = labels[:,4].astype(int)
    alpha = labels[:,5].astype(float)
    bbox = labels[:,6:10].astype(float)
    dimensions = labels[:,10:13].astype(float)
    #location = labels[:,13:16]
    #rotation_y = labels[:,16]
    #score = labels[:,17]

    return frame, track_id, type, truncated, occluded, alpha, bbox, dimensions#, location, rotation_y, score

def importImages(path):
    print("Importing images...")

    i = 0
    grays = []

    images = glob.glob(path + '/*.png')
    assert images
    image_paths_sorted = sorted(images, key=lambda i: int(os.path.splitext(os.path.basename(i))[0]))

    for image in image_paths_sorted:

        picture_number = int(re.sub('\D', '', str(image_paths_sorted[i])))
        i+=1
        
        img = cv2.imread(image)
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

        #Write picture number on image
        cv2.putText(gray, str(picture_number), (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)

        grays.append(gray)

    return grays

# STEREO MATCHING
def getDisparity(images_L, images_R):
    print("Computing disparity...")


    # Create a stereo matcher object
    block_size = 7
    min_disp = 0
    max_disp = 96
    num_disp = max_disp - min_disp
    uniquenessRatio = 5
    speckleWindowSize = 100
    speckleRange = 1
    disp12MaxDiff = 0

    algo = 'bm'
    filt = 'wls_conf'
    no_downscale = False
    max_disp = 160
    wsize = -1
    wls_lambda = 8000.0
    wls_sigma = 1.5
    vis_mult = 1.0
    wsize = 15

    stereo = cv2.StereoSGBM_create(
        minDisparity=min_disp,
        numDisparities=num_disp,
        blockSize=block_size,
        uniquenessRatio=uniquenessRatio,
        speckleWindowSize=speckleWindowSize,
        speckleRange=speckleRange,
        disp12MaxDiff=disp12MaxDiff,
        P1=8 * 1 * block_size * block_size,
        P2=32 * 1 * block_size * block_size,
        mode=cv2.STEREO_SGBM_MODE_SGBM_3WAY,
        preFilterCap=63,
    )


    for i in range(len(images_L)):
        disparity = stereo.compute(images_L[i], images_R[i])
        filtered_disp = cv2.medianBlur(disparity, 5)


        # show images
        cv2.imshow('left eye', images_L[i])
        cv2.imshow('disparity', disparity)
        cv2.imshow('filtered disparity', filtered_disp)
        cv2.waitKey(1000)

def detectKeyPoints(image_L, image_R):
    print("Detecting keypoints...")
    # 1. Detect keypoints and their descriptors
    # Based on: https://docs.opencv.org/master/dc/dc3/tutorial_py_matcher.html

    # Initiate SIFT detector
    sift = cv2.SIFT_create()
    # find the keypoints and descriptors with SIFT
    # kp1, des1 = sift.detectAndCompute(image_L, None)
    # kp2, des2 = sift.detectAndCompute(image_R, None)

    for i in range(len(image_L)):
        kp1, des1 = sift.detectAndCompute(image_L[i], None)
        kp2, des2 = sift.detectAndCompute(image_R[i], None)

        # visualizeKeypoints(image_L[i], kp1)
        # visualizeKeypoints(image_R[i], kp2)

        good_matches, R, t, camera_matrix = matchKeyPoints(des1, des2, kp1, kp2, image_L[i])



    return kp1, des1, kp2, des2

def visualizeKeypoints(img, kp):
    imgSift = cv2.drawKeypoints(img, kp, None, flags=cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)
    cv2.imshow("SIFT Keypoints", imgSift)

def matchKeyPoints(des1, des2, kp1, kp2, left_img):
    print("Matching keypoints...")
    # # Based on: https://docs.opencv.org/master/dc/dc3/tutorial_py_matcher.html
    # FLANN_INDEX_KDTREE = 1
    # index_params = dict(algorithm=FLANN_INDEX_KDTREE, trees=5)
    # search_params = dict(checks=50)   # or pass empty dictionary
    # flann = cv2.FlannBasedMatcher(index_params, search_params)
    # matches = flann.knnMatch(des1, des2, k=2)

    # # Keep good matches: calculate distinctive image features
    # # Lowe, D.G. Distinctive Image Features from Scale-Invariant Keypoints. International Journal of Computer Vision 60, 91–110 (2004). https://doi.org/10.1023/B:VISI.0000029664.99615.94
    # # https://www.cs.ubc.ca/~lowe/papers/ijcv04.pdf
    # matchesMask = [[0, 0] for i in range(len(matches))]
    # good = []
    # pts1 = []
    # pts2 = []

    # for i, (m, n) in enumerate(matches):
    #     if m.distance < 0.7*n.distance:
    #         # Keep this keypoint pair
    #         matchesMask[i] = [1, 0]
    #         good.append(m)
    #         pts2.append(kp2[m.trainIdx].pt)
    #         pts1.append(kp1[m.queryIdx].pt)

    # Match feature points between the left and right images
    bf = cv2.BFMatcher()
    matches = bf.knnMatch(des1, des2, k=2)

    # Apply ratio test to filter out bad matches
    good_matches = []
    for m,n in matches:
        if m.distance < 0.75 * n.distance:
            good_matches.append(m)

    # Estimate the camera motion and 3D structure using SFM
    camera_matrix = np.eye(3)
    E, mask = cv2.findEssentialMat(
        np.float32([kp1[m.queryIdx].pt for m in good_matches]),
        np.float32([kp2[m.trainIdx].pt for m in good_matches]),
        camera_matrix, cv2.RANSAC, 0.999, 1.0)
    _, R, t, mask = cv2.recoverPose(E,
        np.float32([kp1[m.queryIdx].pt for m in good_matches]),
        np.float32([kp2[m.trainIdx].pt for m in good_matches]),
        camera_matrix)
    
    return good_matches, R, t, camera_matrix

    # # Create a 3D plot
    # fig = plt.figure()
    # ax = fig.add_subplot(111, projection='3d')

    # # Add the camera position to the plot
    # ax.scatter(0, 0, 0, c='r', marker='o')

    # # Add the 3D points of the moving objects to the plot
    # points = []
    # for match in good_matches:
    #     pt1 = np.array([kp1[match.queryIdx].pt[0], kp1[match.queryIdx].pt[1], 1])
    #     pt2 = np.array([kp2[match.trainIdx].pt[0], kp2[match.trainIdx].pt[1], 1])
    #     pt_3d = np.matmul(np.linalg.inv(camera_matrix), pt1.reshape(3, 1)) + np.matmul(np.linalg.inv(R), np.matmul(np.linalg.inv(camera_matrix), pt2.reshape(3, 1))) * t[2] / np.matmul(np.linalg.inv(R), np.matmul(np.linalg.inv(camera_matrix), pt2.reshape(3, 1)))[2]
    #     points.append(pt_3d)
    # points = np.array(points)
    # ax.scatter(points[:, 0], points[:, 1], points[:, 2], c='b', marker='.')

    # # Set the limits of the plot
    # ax.set_xlim(-10, 10)
    # ax.set_ylim(-10, 10)
    # ax.set_zlim(-10, 10)

    # # Show the plot
    # plt.show()

def visualizeKeypoints(img1, kp1, img2, kp2, matches, matchesMask):
    # # Draw the keypoint matches between both pictures
    # # Still based on: https://docs.opencv.org/master/dc/dc3/tutorial_py_matcher.html
    # draw_params = dict(matchColor=(0, 255, 0),
    #                 singlePointColor=(255, 0, 0),
    #                 matchesMask=matchesMask[300:500],
    #                 flags=cv2.DrawMatchesFlags_DEFAULT)

    # keypoint_matches = cv2.drawMatchesKnn(
    #     img1, kp1, img2, kp2, matches[300:500], None, **draw_params)
    # cv2.imshow("Keypoint matches", keypoint_matches)

    #Showing the matches in 3d space
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')

    # Add the camera position to the plot
    ax.scatter(0, 0, 0, c='r', marker='o')

    # Add the 3D points of the moving objects to the plot
    points = []
    for match in matches:
        pt1 = np.array([kp1[match.queryIdx].pt[0], kp1[match.queryIdx].pt[1], 1])
        pt2 = np.array([kp2[match.trainIdx].pt[0], kp2[match.trainIdx].pt[1], 1])
        pt_3d = np.matmul(np.linalg.inv(camera_matrix), pt1.reshape(3, 1)) + np.matmul(np.linalg.inv(R), np.matmul(np.linalg.inv(camera_matrix), pt2.reshape(3, 1))) * t[2] / np.matmul(np.linalg.inv(R), np.matmul(np.linalg.inv(camera_matrix), pt2.reshape(3, 1)))[2]
        points.append(pt_3d)
    points = np.array(points)
    ax.scatter(points[:, 0], points[:, 1], points[:, 2], c='b', marker='.')

    # Set the limits of the plot
    ax.set_xlim(-10, 10)
    ax.set_ylim(-10, 10)
    ax.set_zlim(-10, 10)

    # Show the plot
    plt.show()

# SHOWING RESULTS
def drawBoxOnImage(images):
    for i in range(len(images)):
        for j in range(len(frame)):
            if frame[j] == i:
                cv2.rectangle(images[i], (int(bbox[j][0]), int(bbox[j][1])), (int(bbox[j][2]), int(bbox[j][3])), (255, 0, 0), 2)
                cv2.putText(images[i], str(type[j]), (int(bbox[j][0]), int(bbox[j][1])), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 0, 0), 2)
                cv2.imshow("Image", images[i])
                cv2.waitKey(1)

def getMiddleOfBoundingBox(images):
    # getting the coordinates of the middle of the bounding box, label it and return coordinates and label

    x_coordinates = []
    y_coordinates = []
    labels = []
    for i in range(len(images)):
        for j in range(len(frame)):
            if frame[j] == i:
                x_coordinates.append((bbox[j][0] + bbox[j][2]) / 2)
                y_coordinates.append((bbox[j][1] + bbox[j][3]) / 2)
                labels.append(type[j])

    # combining the x and y coordinates
    coordinates = np.array([x_coordinates, y_coordinates])

    # flipping the y coordinates
    coordinates[1] = 375 - coordinates[1]

    return coordinates, labels

def drawDotOnImage(images, coordinates):
    # Draw a dot on the middle of the bounding box
    for i in range(len(images)):
        cv2.circle(images[i], (int(coordinates[i]), 195), 5, (0, 0, 255), -1)
        cv2.imshow("Image", images[i])
        cv2.waitKey(10)

def plotCoordinates(coordinates, labels):
    # Get the x- and y-coordinates from the list of coordinates. X is the first element in each coordinate pair and Y is the second element.
    x_coords = coordinates[0]
    y_coords = coordinates[1]
    # define y_coords as the same length as x_coords with only ones in it
    y_coords = np.ones(len(x_coords))

    # Define the colors for each label
    colors = {'Car': 'red', 'Pedestrian': 'yellow', 'Cyclist': 'purple'}

    # Create a scatter plot with different colors for each label
    for label in set(labels):
        x = [x_coords[i] for i in range(len(x_coords)) if labels[i] == label]
        y = [y_coords[i] for i in range(len(y_coords)) if labels[i] == label]
        plt.scatter(x, y, c=colors[label], label=label)

    # Set the plot title and legend
    plt.title('Object Coordinates')
    plt.legend()

    # Show the plot
    plt.show()

if __name__ == '__main__':

    frame, track_id, type, truncated, occluded, alpha, bbox, dimensions = importLabels()

    images_L = importImages("seq_02/image_02_left/provided")
    #images_R = importImages("seq_02/image_03_right/provided")

    #getDisparity(images_L, images_R)

    # kp1, des1, kp2, des2 = detectKeyPoints(images_L, images_R)
    # good_matches, R, t, camera_matrix = matchKeyPoints(des1, des2, kp1, kp2, images_L)
    
    # visualizeKeypoints(images_L[i], kp1, images_R[i], kp2, good_matches, None)

    #Resizing image
    for i in range(len(images_L)):
        images_L[i] = cv2.resize(images_L[i], (1225, 390), interpolation=cv2.INTER_AREA)
        #images_R[i] = cv2.resize(images_R[i], (1290, 390), interpolation=cv2.INTER_AREA)

    #drawBoxOnImage(images_L)
    #drawBoxOnImage(images_R)

    coordinates, labels  = getMiddleOfBoundingBox(images_L)
    #drawDotOnImage(images_L, coordinates)

    plotCoordinates(coordinates, labels)







