import cv2

import numpy as np

def sum_of_abs_diff(image1, image2):
    assert image1.shape == image2.shape, "Input images must be of the same size"
    return np.sum(np.abs(image1 - image2))

def find_best_match(template, images):
    best_match_index = -1
    best_match_score = float('inf')
    for i, image in enumerate(images):
        h, w = template.shape[:2]
        scores = np.zeros((image.shape[0] - h, image.shape[1] - w))
        for y in range(scores.shape[0]):
            for x in range(scores.shape[1]):
                scores[y, x] = sum_of_abs_diff(template, image[y:y+h, x:x+w])
        min_score = scores.min()
        if min_score < best_match_score:
            best_match_score = min_score
            best_match_index = i
    return best_match_index

nose_left = cv2.imread('nose_left.png', cv2.IMREAD_GRAYSCALE)
nose1 = cv2.imread('nose1.png', cv2.IMREAD_GRAYSCALE)
nose2 = cv2.imread('nose2.png', cv2.IMREAD_GRAYSCALE)
nose3 = cv2.imread('nose3.png', cv2.IMREAD_GRAYSCALE)

images = [nose1, nose2, nose3]
best_match_index = find_best_match(nose_left, images)

if best_match_index == 0:
    print('The best match is nose1.png')
elif best_match_index == 1:
    print('The best match is nose2.png')
elif best_match_index == 2:
    print('The best match is nose3.png')
else:
    print('No match found')