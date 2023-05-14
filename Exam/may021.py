

import cv2
import numpy as np
import matplotlib.pyplot as plt


# Question 1

# What is the output of a smoothing, linear filter

# 1. Minimum of pixel values
# 2. Maximum of pixel values
# 3. Average of pixel values
# 4. Median of pixel values

# Answer: 3

# Question 2

matrix3x3 = np.array([[0,0,0],[0,0,0],[0,1,0]])

# convolve matrix3x3 with the image Ex21_1.png
img = cv2.imread('Ex21_1.png')
img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
img2 = cv2.filter2D(img, -1, matrix3x3)

# display before and after images
plt.subplot(121),plt.imshow(img, cmap = 'gray')
plt.title('Original'), plt.xticks([]), plt.yticks([])
plt.subplot(122),plt.imshow(img2, cmap = 'gray')
plt.title('Filtered'), plt.xticks([]), plt.yticks([])
plt.show()


# Question 10

# import Ex21_1.png and convert to grayscale image
img = cv2.imread('Ex21_1.png')
img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# apply canny edge detection to the image with parameters 100, 200
edges = cv2.Canny(img,100,200)

# apply HoughLines to the image with parameters rho = 1, theta = 0.0017 and threshold = 200
lines = cv2.HoughLines(edges,1,0.0017,200)

# how many lines are detected
print("lines detected: ", lines)



# Question 11

#import Ex21_1.png and convert to grayscale image
img = cv2.imread('Ex21_1.png')
img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# apply harris corner detection to the image with parameters blockSize = 2, ksize = 3, k = 0.04
dst = cv2.cornerHarris(img,2,3,0.04)

# detecting how many values are greater than 0.01
count = 0
for i in range(len(dst)):
    for j in range(len(dst[i])):
        if dst[i][j] > 0.01:
            count += 1

# print the number of corners detected
print("Number of corners detected: ", count)



