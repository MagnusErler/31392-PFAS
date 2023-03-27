import cv2
import numpy as np
from matplotlib import pyplot as plt

cap = cv2.VideoCapture(r'Robots.mp4')
old_frame = cap.read()[1]


while(cap.isOpened()):
    ret, new_frame = cap.read()

    if ret == False:
        print('Error reading video file')
        break

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

        # Write the robotname on top of the bounding rectangle
        cv2.putText(new_frame2, 'Robot' + str(i+1), (x, y-10), cv2.FONT_HERSHEY_SIMPLEX, 2, (0, 0, 255), 2, cv2.LINE_AA)

        # Write the number of objects on the image
        cv2.putText(new_frame2, 'Number of objects: ' + str(len(contours)), (10, 50), cv2.FONT_HERSHEY_SIMPLEX, 2, (0, 0, 255), 2, cv2.LINE_AA)


    cv2.namedWindow('image', cv2.WINDOW_NORMAL)
    cv2.resizeWindow('image', 1000, 1000)
    cv2.imshow('image', new_frame2)
    cv2.waitKey(20)



cap.release()
cv2.destroyAllWindows()
