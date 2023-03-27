'''
- Load the two images and convert them to grayscale (do not change the size!).
- Use cv2.goodFeaturesToTrack to find features on the first image (things1.png) using the parameters "maxCorners=100", "qualityLevel=0.3", and
"minDistance=7".
- Apply sparse optical flow using the function cv2.calcOpticalFlowPyrLK()
- Find the maximum amount of pixels moved for any object in the x direction (horizontally)
'''
import cv2
import numpy as np

# Parameters
img1_path = "./data/things1.png"
img2_path = "./data/things2.png"
# for goodFeaturesToTrack
maxCorners = 100
qualityLevel = 0.3
minDistance = 7

# Load img
img1 = cv2.imread(img1_path)
img2 = cv2.imread(img2_path)

# Convert to grayscale
gray1 = cv2.cvtColor(img1, cv2.COLOR_BGR2GRAY)
gray2 = cv2.cvtColor(img2, cv2.COLOR_BGR2GRAY)

# Use cv2.goodFeaturesToTrack to find features on the first image (things1.png) using the parameters 
points_1 = cv2.goodFeaturesToTrack(gray1, maxCorners, qualityLevel, minDistance)

# Apply sparse optical flow using the function ccv2.calcOpticalFlowPyrLK()
points_2, _, _ = cv2.calcOpticalFlowPyrLK(gray1, gray2, points_1, None)

# Find the maximum amount of pixels moved for any object in the x direction (horizontally)
max_x = np.abs(points_1[:,:,0]-points_2[:,:,0]).max()

print(f"Maximum amount of pixels moved for any object in the x direction (horizontally): {max_x}")