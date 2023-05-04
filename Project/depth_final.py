import numpy as np
import cv2 as cv
import os
from matplotlib import pyplot as plt
plt.rcParams.update({'font.size': 8})

def depth_map(imgL, imgR, withFilter):

    window_size = 5

    left_matcher = cv.StereoSGBM_create(
        minDisparity=-5,
        numDisparities=9*16,  # max_disp has to be dividable by 16 f. E. HH 192, 256
        blockSize=window_size,
        P1=9 * 3 * window_size,
        P2=128 * 3 * window_size,
        disp12MaxDiff=12,
        uniquenessRatio=40,
        speckleWindowSize=50,
        speckleRange=32,
        preFilterCap=63,
        mode=cv.STEREO_SGBM_MODE_SGBM_3WAY
    )

    if(withFilter):
        right_matcher = cv.ximgproc.createRightMatcher(left_matcher)
        # FILTER Parameters
        lmbda = 60000
        sigma = 1.7
        visual_multiplier = 6

        wls_filter = cv.ximgproc.createDisparityWLSFilter(matcher_left=left_matcher)
        wls_filter.setLambda(lmbda)
        wls_filter.setSigmaColor(sigma)

        displ = left_matcher.compute(imgL, imgR)  # .astype(np.float32)/16
        dispr = right_matcher.compute(imgR, imgL)  # .astype(np.float32)/16
        displ = np.int16(displ)
        dispr = np.int16(dispr)
        processedImg = wls_filter.filter(displ, imgL, None, dispr)  # important to put "imgL" here!!!
        processedImg = cv.normalize(src=processedImg, dst=processedImg, beta=0, alpha=255, norm_type=cv.NORM_MINMAX);
        processedImg = np.uint8(processedImg)
    else:
        displ = left_matcher.compute(imgL, imgR)  # .astype(np.float32)/16
        displ = np.int16(displ)
        processedImg = cv.normalize(src=displ, dst=displ, beta=0, alpha=255, norm_type=cv.NORM_MINMAX)
        processedImg = np.uint8(processedImg)

    return processedImg


# imgL = cv.imread("seq_02/image_02_left/provided/0000000000.png", cv.IMREAD_GRAYSCALE)
# imgR = cv.imread("seq_02/image_03_right/provided/0000000000.png", cv.IMREAD_GRAYSCALE)

# depth_map = depth_map(imgL, imgR, True) # Maybe try BM matcher: stereo = cv.StereoBM_create(numDisparities=-1, blockSize=11)
# cv.imshow('Depth Map', depth_map)
# plt.imshow(depth_map)
# plt.axis('off')
# plt.show()
# cv.waitKey(0)
# cv.destroyAllWindows()

left_folder_path = 'seq_02/image_02_left/provided'
right_folder_path = 'seq_02/image_03_right/provided'

result_folder_path = 'seq_02/depth'

for filename in os.listdir(left_folder_path):
    if filename.endswith('.png'):  # adjust the file extension to match your images
        left_image_path = os.path.join(left_folder_path, filename)
        right_image_path = os.path.join(right_folder_path, filename)
        left_image = cv.imread(left_image_path, cv.IMREAD_GRAYSCALE)
        right_image = cv.imread(right_image_path, cv.IMREAD_GRAYSCALE)
        result_image = depth_map(left_image, right_image, True)  # adjust the parameters as needed
        result_image_path = os.path.join(result_folder_path, filename)
        cv.imwrite(result_image_path, result_image)