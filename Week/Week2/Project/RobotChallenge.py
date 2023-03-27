import cv2
import numpy as np
from matplotlib import pyplot as plt

cap = cv2.VideoCapture(r'Robots.mp4')
old_frame = cap.read()[1]




sift = cv2.SIFT_create()

# First reference picture
refFrame = cv2.imread("refFrame.png")
b,g,r = cv2.split(refFrame) # Changing the order from bgr to rgb so that matplotlib can show it
refFrame = cv2.merge([r,g,b])

kp, des = sift.detectAndCompute(refFrame, None) #Keypoints and descriptors

def newRefFrame(frame, x, y, w, h):

    refFrame = frame[y:y+h, x:x+w]

    b,g,r = cv2.split(refFrame) # Changing the order from bgr to rgb so that matplotlib can show it
    img = cv2.merge([r,g,b])

    kp, des = sift.detectAndCompute(img, None) #Keypoints and descriptors

    return refFrame, kp


while(cap.isOpened()):
    ret, new_frame = cap.read()

    if ret == False:
        print('Error reading video file')
        break

    if refFrame is not None:
        b,g,r = cv2.split(refFrame) # Changing the order from bgr to rgb so that matplotlib can show it
        img = cv2.merge([r,g,b])

        kp, des = sift.detectAndCompute(img, None) #Keypoints and descriptors

    


    # New Frame
    ret, new_frame = cap.read()

    img2 = new_frame
    b,g,r = cv2.split(img2) # Changing the order from bgr to rgb so that matplotlib can show it
    img2 = cv2.merge([r,g,b])

    gray2 = cv2.cvtColor(img2, cv2.COLOR_RGB2GRAY)

    kp2, des2 = sift.detectAndCompute(gray2, None)


    coor2 = np.float32([kp2.pt for kp2 in kp2])

    #print("coor2: ", coor2)
    #print("lenght of coor2: ", len(coor2))

    bf = cv2.BFMatcher()
    matches = bf.match(des, des2)

    #img_idx = matches.trainIdx
    #(x,y) = kp2[img_idx].pt

    #print("x,y: ", x, y)



    matches = sorted(matches, key = lambda x:x.distance)

    # Convert matches to points
    src_pts = np.float32([ kp[m.queryIdx].pt for m in matches ]).reshape(-1,1,2)
    dst_pts = np.float32([ kp2[m.trainIdx].pt for m in matches ]).reshape(-1,1,2)

    # Print src_pts and dst_pts
    print("src_pts: ", src_pts)
    print("dst_pts: ", dst_pts)

    print("dst_pts[:,0,0]: ", dst_pts[:,0,0])
    print("dst_pts[:,0,1]: ", dst_pts[:,0,1])

    #Average of the x and y coordinates
    dst_x_avg = np.mean(dst_pts[:,0,0])
    dst_y_avg = np.mean(dst_pts[:,0,1])

    dst_x_median = np.median(dst_pts[:,0,0])
    dst_y_median = np.median(dst_pts[:,0,1])


    # Draw circle with center at the average of the x and y coordinates
    cv2.circle(img2, (int(dst_x_avg), int(dst_y_avg)), 10, (0, 0, 255), -1)
    

    #print("dst_x_avg: ", dst_x_avg)
    #print("dst_y_avg: ", dst_y_avg)

    img3 = cv2.drawMatches(img,kp,img2,kp2,matches[:50],None,flags=cv2.DrawMatchesFlags_NOT_DRAW_SINGLE_POINTS)






    # copy the new frame to the old frame
    new_frame2 = new_frame.copy()

    # subract two frames to get the difference
    frame_delta = cv2.absdiff(new_frame.copy(), old_frame.copy())

    old_frame = new_frame

    frame_delta_gray = cv2.cvtColor(frame_delta.copy(), cv2.COLOR_BGR2GRAY)

    ret, thresh = cv2.threshold(frame_delta_gray.copy(), 90, 255, 0)

    # dialate the image to fill in the holes
    kernel = np.ones((5, 5), np.uint8)
    n = 50
    thresh = cv2.dilate(thresh.copy(), kernel, iterations=n)
    thresh = cv2.erode(thresh.copy(), kernel, iterations=n)
    thresh = cv2.dilate(thresh.copy(), kernel, iterations=n)
    thresh = cv2.erode(thresh.copy(), kernel, iterations=n)

    # count objects
    (contours, hierarchy) = cv2.findContours(thresh.copy(), cv2.RETR_TREE, cv2.CHAIN_APPROX_NONE)

    #print(len(contours))

    for i in range(len(contours)):
        cnt = contours[i]

        # computing the bounding rectangle of the contour
        x, y, w, h = cv2.boundingRect(cnt)

        # draw contour
        new_frame2 = cv2.drawContours(new_frame2, [cnt], 0, (0, 255, 255), 2)

        # draw the bounding rectangle if it is big enough
        if w > 100 and h > 100 and w < 400 and h < 400:
            new_frame2 = cv2.rectangle(new_frame2, (x, y), (x+w, y+h), (0, 255, 0), 2)

        refFrame, kp = newRefFrame(new_frame, x, y, w, h)


        #print("Keypoints: ", kp)

        #Convert keypoint kp to coordinates
        coor = np.float32([kp.pt for kp in kp])

        #print("coor: ", coor)

        # Write the robotname on top of the bounding rectangle
        cv2.putText(new_frame2, 'Robot' + str(i+1), (x, y-10), cv2.FONT_HERSHEY_SIMPLEX, 2, (0, 0, 255), 2, cv2.LINE_AA)

        # Write the number of objects on the image
        cv2.putText(new_frame2, 'Number of objects: ' + str(len(contours)), (10, 50), cv2.FONT_HERSHEY_SIMPLEX, 2, (0, 0, 255), 2, cv2.LINE_AA)


    cv2.namedWindow('image', cv2.WINDOW_NORMAL)
    cv2.resizeWindow('image', 1000, 1000)
    cv2.imshow('image', img3)
    cv2.waitKey(20)



cap.release()
cv2.destroyAllWindows()
