'''
- The series you have measured is: [47, 211, 38, 53, 204, 116, 152, 249, 143, 177]
- Correct intensities: [39, 55, 207]
- SAD(sum of absolute differencess) template matching
'''
import numpy as np
import cv2

# Input
measurements = np.array([47, 211, 38, 53, 204, 116, 152, 249, 143, 177])
correct_intensities = np.array([39, 55, 207])

# Sum of absolute differences
sad = lambda x, y: np.sum(np.abs(x-y))

# Sum of squared differences
ssd = lambda x, y: np.sum((x-y)**2)


def match(measurements, correct, func):
    scores = [func(measurements[i:i+len(correct)], correct) for i, _ in enumerate(measurements[:-len(correct)])]

    # Find the minimum score
    min_score = min(scores)
    print(f"Minimum score: {min_score}")

    # Find the index of the minimum score
    min_index = scores.index(min_score)
    print(f"Best matching: {measurements[min_index:min_index+len(correct)]}")
    return min_index, min_score


match(measurements, correct_intensities, func = sad)