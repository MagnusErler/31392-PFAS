

import cv2
import numpy as np

noseL = cv2.imread('nose_left.png', 0)
noseR = cv2.imread('nose_right.png', 0)
nose_span = cv2.imread('nose_span.png', 0)
nose1 = cv2.imread('nose1.png', 0)
nose2 = cv2.imread('nose2.png', 0)
nose3 = cv2.imread('nose3.png', 0)
tsukubaL = cv2.imread('tsukuba_left.png', 0)
tsukubaR = cv2.imread('tsukuba_right.png', 0)


#Taking nose_left.png and nose_right.png as input and calculating the sum of absolute differences between the two images
def calculate_sad(img1, img2):

    #print("img1.shape: " + str(img1.shape))
    #print("img2.shape: " + str(img2.shape))

    sad = 0
    for i in range(img1.shape[0]):
        for j in range(img1.shape[1]):
            sad += abs(img1[i][j] - img2[i][j])
    return sad

# Intermediate step 1:
sad = calculate_sad(noseL, noseR)
print("noseL vs noseR: " + str(sad))

# Intermediate step 2:
sad = calculate_sad(noseL, nose1)
print("noseL vs nose1: " + str(sad))

sad = calculate_sad(noseL, nose2)
print("noseL vs nose2: " + str(sad))

sad = calculate_sad(noseL, nose3)
print("noseL vs nose3: " + str(sad))

# Intermediate step 3:

print("width of nose_span: " + str(nose_span.shape[1]))
print("height of nose_span: " + str(nose_span.shape[0]))

# Taking a sample of nose_span of 7x7 pixels
nose_span_sample = nose_span[0:7, 0:7]

print("noseL vs nose_span_sample: " + str(calculate_sad(noseL, nose_span_sample)))

min_sad = 100000000

for i in range(0, nose_span.shape[1] - 7):
    # img[y:y+h, x:x+w]
    nose_span_sample = nose_span[0:7, i:i+7]
    
    sad = calculate_sad(nose_span_sample, noseR)
    if min_sad > sad:
        min_sad = sad
        min_sad_x = i
        min_sad_y = 0

    print("noseL vs nose_span_sample; x, y: " + str(sad) + ", " + str(i) + ", " + str(0))

print("min_sad: " + str(min_sad))
print("x, y: " + str(min_sad_x) + ", " + str(min_sad_y))


# Intermediate step 5:












