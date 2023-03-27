'''
- Convert the image to grayscale (do not change the size!).
- Apply Harris corner (cv2.cornerHarris) to the image with the parameters "blockSize=2", "ksize=3", "k=0.04"
'''
import cv2
# Parameters
img_path = "./data/books.png"
# for Harris
blockSize=2
ksize=3
k=0.04 
treshold = 0.01

# Load img
img = cv2.imread("./data/books.png")

# Convert to grayscale
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Apply Harris corner (cv2.cornerHarris) to the image with the parameters "blockSize=2", "ksize=3", "k=0.04"
harris = cv2.cornerHarris(gray, blockSize, ksize, k)

# Find number of values above 0.01
num_values = harris[harris > treshold].size
print(f"Number of values above {treshold}: {num_values}")