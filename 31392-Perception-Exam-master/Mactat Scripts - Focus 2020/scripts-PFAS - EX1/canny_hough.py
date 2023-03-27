'''
- Convert it to grayscale (do not change the size!).
- Apply Canny edge detection (cv2.Canny) with the parameters "threshold1=100" and "threshold2=200".
- Apply HoughLines (cv2.HoughLines) with the parameters "rho=1", "theta=0.0017", "threshold=200".
'''

import cv2

# Parameters
img_path = "./data/books.png"
# for Canny
threshold1 = 100
threshold2 = 200
# for HoughLines
rho = 1
theta = 0.0017
threshold = 200


# Load img
img = cv2.imread("./data/books.png")

# Convert to grayscale
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Apply Canny edge detection (cv2.Canny) with the parameters "threshold1=100" and "threshold2=200".
edges = cv2.Canny(gray, threshold1, threshold2)

# Apply HoughLines (cv2.HoughLines) with the parameters "rho=1", "theta=0.0017", "threshold=200".
lines = cv2.HoughLines(edges, rho, theta, threshold)

# Print number of lines detected
print(f"Number of lines detected: {len(lines)}")