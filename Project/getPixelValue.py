import cv2 as cv
import numpy as np

def getPixelValue(image_path, y, x):

    img = image_path
    #img = cv.cvtColor(image_path, cv.COLOR_BGR2GRAY)
    print(img.shape)
    # show the image
    #cv.imshow("Image", img)
    #cv.waitKey(0)

    #img = cv.imread(image_path, cv.IMREAD_GRAYSCALE)
    if x < 0 or y < 0:
        print("Error: x or y is negative")
        return -1
    
    kernel1 = np.ones((7,7),np.float32)/49
    blur = cv.filter2D(img,-1,kernel1)

    kernel2 = np.array([[1, 1, 1], [1, 1, 1], [1, 1, 1]])

    neighborhood = blur[x-1:x+2, y-1:y+2]
    
    return np.sum(kernel2 * neighborhood)