'''
- Determine the approximate coefficients of the epipolar lines in th imageset left.png and right.png by taking the average of all the epipolar lines.
- Use 2000 of the best matching sift keypoints to compute the epipolar lines.
- Opencv computes the epipolar lines in the form ax+by+c=0.
'''
import cv2
import numpy as np

# Parameters
img1_path = "./data/left.png"
img2_path = "./data/right.png"

sift_keypoints = 2000

# Load img
img1 = cv2.imread(img1_path)
img2 = cv2.imread(img2_path)

# SIFT
sift = cv2.SIFT_create()

# find the keypoints and descriptors with SIFT
kp1, des1 = sift.detectAndCompute(img1, None)
kp2, des2 = sift.detectAndCompute(img2, None)

# BFMatcher
bf = cv2.BFMatcher()
matches = bf.match(des1,des2)

# Sort them in the order of their distance (i.e. best matches first).
matches = sorted(matches, key = lambda x:x.distance)
pts = np.array([(kp1[m.queryIdx].pt, kp2[m.trainIdx].pt) for m in matches[:sift_keypoints]])
pts1, pts2 = np.int32(pts[:,0]), np.int32(pts[:,1])

# Implement findFundamentalMat here:
F, mask = cv2.findFundamentalMat(pts1,pts2)

# We select only inlier points
pts1 = pts1[mask.ravel() == 1]
pts2 = pts2[mask.ravel() == 1]

# Find epilines corresponding to points in right image (second image) and
lines1 = cv2.computeCorrespondEpilines(pts2.reshape(-1, 1, 2), 2 ,F)
lines1 = lines1.reshape(-1, 3)

# Find epilines corresponding to points in left image (first image) and
lines2 = cv2.computeCorrespondEpilines(pts1.reshape(-1, 1, 2), 1, F)
lines2 = lines2.reshape(-1, 3)


line1Mean = np.mean(lines1, axis=0)
line2Mean = np.mean(lines2, axis=0)

l1m_string = [f"{x:.2e}" for x in line1Mean]
l2m_string = [f"{x:.2e}" for x in line2Mean]

print(f"Line 1: {' '.join(l1m_string)}")
print(f"Line 2: {' '.join(l2m_string)}")
