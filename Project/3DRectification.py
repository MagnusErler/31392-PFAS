
import cv2
import glob
import re
import os
import numpy as np

def importImages(path):

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

def detectKeyPoints(image_L, image_R):
    # 1. Detect keypoints and their descriptors
    # Based on: https://docs.opencv.org/master/dc/dc3/tutorial_py_matcher.html

    # Initiate SIFT detector
    sift = cv2.SIFT_create()
    # find the keypoints and descriptors with SIFT
    kp1, des1 = sift.detectAndCompute(image_L, None)
    kp2, des2 = sift.detectAndCompute(image_R, None)

def visualizeKeypoints(img, kp):
    imgSift = cv2.drawKeypoints(img, kp, None, flags=cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)
    cv2.imshow("SIFT Keypoints", imgSift)

def matchKeyPoints(des1, des2, kp1, kp2):
    # Based on: https://docs.opencv.org/master/dc/dc3/tutorial_py_matcher.html
    FLANN_INDEX_KDTREE = 1
    index_params = dict(algorithm=FLANN_INDEX_KDTREE, trees=5)
    search_params = dict(checks=50)   # or pass empty dictionary
    flann = cv2.FlannBasedMatcher(index_params, search_params)
    matches = flann.knnMatch(des1, des2, k=2)

    # Keep good matches: calculate distinctive image features
    # Lowe, D.G. Distinctive Image Features from Scale-Invariant Keypoints. International Journal of Computer Vision 60, 91–110 (2004). https://doi.org/10.1023/B:VISI.0000029664.99615.94
    # https://www.cs.ubc.ca/~lowe/papers/ijcv04.pdf
    matchesMask = [[0, 0] for i in range(len(matches))]
    good = []
    pts1 = []
    pts2 = []

    for i, (m, n) in enumerate(matches):
        if m.distance < 0.7*n.distance:
            # Keep this keypoint pair
            matchesMask[i] = [1, 0]
            good.append(m)
            pts2.append(kp2[m.trainIdx].pt)
            pts1.append(kp1[m.queryIdx].pt)

def visualizeKeypoints(img1, kp1, img2, kp2, matches, matchesMask):
    # Draw the keypoint matches between both pictures
    # Still based on: https://docs.opencv.org/master/dc/dc3/tutorial_py_matcher.html
    draw_params = dict(matchColor=(0, 255, 0),
                    singlePointColor=(255, 0, 0),
                    matchesMask=matchesMask[300:500],
                    flags=cv2.DrawMatchesFlags_DEFAULT)

    keypoint_matches = cv2.drawMatchesKnn(
        img1, kp1, img2, kp2, matches[300:500], None, **draw_params)
    cv2.imshow("Keypoint matches", keypoint_matches)

if __name__ == '__main__':
    images_L = importImages("seq_02/image_02_left/undistorted")
    images_R = importImages("seq_02/image_03_right/undistorted")


    #get size of image
    (height, width) = images_L[0].shape
    print(height, width)

    for i in range(len(images_L)):
        # Show all pictures
        cv2.imshow("Left", images_L[i])
        cv2.imshow("Right", images_R[i])
        cv2.waitKey(50)
        




