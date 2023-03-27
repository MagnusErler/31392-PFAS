
import numpy as np
import cv2
import glob
import matplotlib.pyplot as plt
import copy

# import images
#img_left = cv2.imread('Project/Project_week_4/left-0000.png')
#img_right = cv2.imread('Project/Project_week_4/right-0000.png')

img_left = []
img_right = []


def undistorting_left_img():
    #Implement the number of vertical and horizontal corners
    nb_vertical = 6
    nb_horizontal = 9


    # prepare object points, like (0,0,0), (1,0,0), (2,0,0) ....,(6,5,0)
    objp = np.zeros((nb_horizontal*nb_vertical,3), np.float32)
    objp[:,:2] = np.mgrid[0:nb_vertical,0:nb_horizontal].T.reshape(-1,2)

    # Arrays to store object points and image points from all the images.
    objpoints = [] # 3d point in real world space
    imgpoints = [] # 2d points in image plane.

    images = glob.glob('imgs/left-*.png')
    assert images


    for fname in images:
        img = cv2.imread(fname)
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        
        ret, corners = cv2.findChessboardCorners(img, (nb_vertical,nb_horizontal), None)

        # If found, add object points, image points (after refining them)
        if ret == True:
            objpoints.append(objp)

            imgpoints.append(corners)

            img_left.append(img)

            # Draw and display the corners
            img = cv2.drawChessboardCorners(img, (nb_vertical,nb_horizontal), corners,ret)
            #cv2.imshow('img',img)
            #cv2.waitKey(500)

    cv2.destroyAllWindows()

    # Using the extracted corners we can obtain a camera matrix that contains the information needed to undistort images
    ret, mtx, dist, rvecs, tvecs = cv2.calibrateCamera(objpoints, imgpoints, gray.shape[::-1], None, None)
    img = cv2.imread('imgs/left-0000.png')
    h,  w = img.shape[:2]
    newcameramtx_left, roi = cv2.getOptimalNewCameraMatrix(mtx,dist,(w,h),1,(w,h))


    # Undistorting all images in the folder imgs and saving them in the folder undistorted_imgs
    images = glob.glob('imgs/left-*.png')
    assert images

    for fname in images:
        img = cv2.imread(fname)
        dst = cv2.undistort(img, mtx, dist, None, newcameramtx_left)
        cv2.imwrite('undistorted_imgs/' + fname[5:], dst)

    return newcameramtx_left, dist, objpoints, imgpoints, gray

def undistorting_right_img():
    #Implement the number of vertical and horizontal corners
    nb_vertical = 6
    nb_horizontal = 9


    # prepare object points, like (0,0,0), (1,0,0), (2,0,0) ....,(6,5,0)
    objp = np.zeros((nb_horizontal*nb_vertical,3), np.float32)
    objp[:,:2] = np.mgrid[0:nb_vertical,0:nb_horizontal].T.reshape(-1,2)

    # Arrays to store object points and image points from all the images.
    objpoints = [] # 3d point in real world space
    imgpoints = [] # 2d points in image plane.

    images = glob.glob('imgs/right-*.png')
    assert images


    for fname in images:
        img = cv2.imread(fname)
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        
        ret, corners = cv2.findChessboardCorners(img, (nb_vertical,nb_horizontal), None)

        # If found, add object points, image points (after refining them)
        if ret == True:
            objpoints.append(objp)

            imgpoints.append(corners)

            img_right.append(img)

            # Draw and display the corners
            img = cv2.drawChessboardCorners(img, (nb_vertical,nb_horizontal), corners,ret)
            #cv2.imshow('img',img)
            #cv2.waitKey(500)

    cv2.destroyAllWindows()

    # Using the extracted corners we can obtain a camera matrix that contains the information needed to undistort images
    ret, mtx, dist, rvecs, tvecs = cv2.calibrateCamera(objpoints, imgpoints, gray.shape[::-1], None, None)
    img = cv2.imread('imgs/right-0000.png')
    h,  w = img.shape[:2]
    newcameramtx_right, roi = cv2.getOptimalNewCameraMatrix(mtx,dist,(w,h),1,(w,h))


    # Undistorting all images in the folder imgs and saving them in the folder undistorted_imgs
    images = glob.glob('imgs/right-*.png')
    assert images

    for fname in images:
        img = cv2.imread(fname)
        dst = cv2.undistort(img, mtx, dist, None, newcameramtx_right)
        cv2.imwrite('undistorted_imgs/' + fname[5:], dst)

    return newcameramtx_right, dist, objpoints, imgpoints, gray


nb_horizontal = 9
nb_vertical = 6
# world coordinates中，x先变化，然后是y，z全为0
objp = np.zeros((nb_horizontal*nb_vertical,3), np.float32) # set x and y coordinates
objp[:,:2] = np.mgrid[0:nb_vertical,0:nb_horizontal].T.reshape(-1,2) # set z coordinates

##
# first read images, then extract image points 
left = glob.glob("imgs/left*.png")
right = glob.glob("imgs/right*.png")
imgpl = []
imgpr = []
img_left = []
img_right = []
objpoints = []
for i in range(len(left)):
    iml = cv2.imread(left[i])
    imr = cv2.imread(right[i])
    retl, corners_l = cv2.findChessboardCorners(iml,(nb_vertical,nb_horizontal))
    retr, corners_r = cv2.findChessboardCorners(imr,(nb_vertical,nb_horizontal))
    imgl = copy.deepcopy(iml)
    imgr = copy.deepcopy(imr)
    cv2.drawChessboardCorners(imgl, (nb_vertical,nb_horizontal), corners_l, retl)
    cv2.drawChessboardCorners(imgr, (nb_vertical,nb_horizontal), corners_r, retr)
    if retl and retr: # only when both of the images in a pair has the corners
        imgpl.append(corners_l)
        imgpr.append(corners_r)
        img_left.append(iml)
        img_right.append(imr)
        objpoints.append(objp)
    cv2.imshow('left', imgl)
    cv2.waitKey(5)
    cv2.imshow('right', imgr)
    cv2.waitKey(10)
cv2.destroyAllWindows()
gray = cv2.cvtColor(iml, cv2.COLOR_RGB2GRAY)
# determine the camera matirx 1
ret1, mtx1, dist1, rvecs1, tvecs1 = cv2.calibrateCamera(objpoints, imgpl, gray.shape[::-1], None, None)
gray = cv2.cvtColor(imr, cv2.COLOR_RGB2GRAY)
# determine the camera matirx 2
ret2, mtx2, dist2, rvecs2, tvecs2 = cv2.calibrateCamera(objpoints, imgpr, gray.shape[::-1], None, None)


def drawlines(img1, img2, lines, pts1, pts2):
    r, c = img1.shape
    img1 = cv2.cvtColor(img1, cv2.COLOR_GRAY2BGR)
    img2 = cv2.cvtColor(img2, cv2.COLOR_GRAY2BGR)
    for r, pt1, pt2 in zip(lines, pts1, pts2):
        color = tuple(np.random.randint(0,255,3).tolist())
        x0, y0 = map(int, [0, -r[2]/r[1]])
        x1, y1 = map(int, [c, -(r[2]+r[0]*c)/r[1]])
        img1 = cv2.line(img1, (x0,y0),(x1,y1),color,2)
        img1 = cv2.circle(img1, tuple(pt1), 5, color, -1)
        img2 = cv2.circle(img2, tuple(pt2), 5, color, -1)
    return img1, img2

def calLines(iml, imr, numMatches=300, plot=False):
    iml = cv2.cvtColor(iml, cv2.COLOR_RGB2GRAY)
    imr = cv2.cvtColor(imr, cv2.COLOR_RGB2GRAY)


    #sift = cv2.xfeatures2d_SIFT.create()
    sift = cv2.SIFT_create()
    kp1, des1 = sift.detectAndCompute(iml, None)
    kp2, des2 = sift.detectAndCompute(imr, None)
    matcher = cv2.FlannBasedMatcher()
    match = matcher.match(des1, des2)
    # select the most relevant 300 matches
    match = sorted(match, key=lambda x:x.distance)
    good = []
    pts1 = []
    pts2 = []
    for m in match[:numMatches]:
        good.append(m)
        pts1.append(kp1[m.queryIdx].pt)
        pts2.append(kp2[m.trainIdx].pt)
    pts1 = np.int32(pts1)
    pts2 = np.int32(pts2)
    F, mask = cv2.findFundamentalMat(pts1, pts2, cv2.FM_LMEDS)
    # select inlier points
    pts1 = pts1[mask.ravel() == 1]
    pts2 = pts2[mask.ravel() == 1]
    lines1 = cv2.computeCorrespondEpilines(pts2.reshape(-1,1,2), 2, F)
    lines1 = lines1.reshape(-1,3)
    lines2 = cv2.computeCorrespondEpilines(pts1.reshape(-1,1,2), 1, F)
    lines2 = lines2.reshape(-1,3)
    iml1, iml2 = drawlines(iml, imr, lines1, pts1, pts2)
    imr1, imr2 = drawlines(imr, iml, lines2, pts2, pts1)
    if plot:
        plt.subplot(1,2,1)
        plt.imshow(iml1)
        plt.subplot(1,2,2)
        plt.imshow(imr1)
        plt.show()

def calLines2(iml, imr, numMatches=300, plot=False):
    iml = cv2.cvtColor(iml, cv2.COLOR_RGB2GRAY)
    imr = cv2.cvtColor(imr, cv2.COLOR_RGB2GRAY)


    #sift = cv2.xfeatures2d_SIFT.create()
    sift = cv2.SIFT_create()
    kp1, des1 = sift.detectAndCompute(iml, None)
    kp2, des2 = sift.detectAndCompute(imr, None)
    matcher = cv2.FlannBasedMatcher()
    match = matcher.match(des1, des2)
    # select the most relevant 300 matches
    match = sorted(match, key=lambda x:x.distance)
    good = []
    pts1 = []
    pts2 = []
    for m in match[:numMatches]:
        good.append(m)
        pts1.append(kp1[m.queryIdx].pt)
        pts2.append(kp2[m.trainIdx].pt)
    pts1 = np.int32(pts1)
    pts2 = np.int32(pts2)
    F, mask = cv2.findFundamentalMat(pts1, pts2, cv2.FM_LMEDS)
    # select inlier points
    pts1 = pts1[mask.ravel() == 1]
    pts2 = pts2[mask.ravel() == 1]
    lines1 = cv2.computeCorrespondEpilines(pts2.reshape(-1,1,2), 2, F)
    lines1 = lines1.reshape(-1,3)
    lines2 = cv2.computeCorrespondEpilines(pts1.reshape(-1,1,2), 1, F)
    lines2 = lines2.reshape(-1,3)
    iml1, iml2 = drawlines(iml, imr, lines1, pts1, pts2)
    imr1, imr2 = drawlines(imr, iml, lines2, pts2, pts1)
    if plot:
        plt.subplot(1,2,1)
        plt.imshow(iml1)
        plt.subplot(1,2,2)
        plt.imshow(imr1)
        plt.show()

#use calLines for all pairs of images in the folder undistorted_imgs
def calLinesAll():
    images = glob.glob('undistorted_imgs/left-*.png')
    assert images

    for fname in images:
        iml = cv2.imread(fname)
        imr = cv2.imread('undistorted_imgs/righ' + fname[20:])


        calLines(iml, imr, 300, True)

def stereoRectify(iml, imr):
    R1, R2, P1, P2, Q, roi1, roi2 = cv2.stereoRectify(mtx1, dist1, mtx2, dist2, gray.shape[::-1],R, T)
    undis_img_sizel = iml.shape[:2]
    undis_img_sizel = undis_img_sizel[::-1]
    undis_img_sizer = imr.shape[:2]
    undis_img_sizer = undis_img_sizer[::-1]
    mapl1, mapl2 = cv2.initUndistortRectifyMap(mtx1, dist1, R1, P1, undis_img_sizel, cv2.CV_32FC1)
    mapr1, mapr2 = cv2.initUndistortRectifyMap(mtx2, dist2, R2, P2, undis_img_sizer, cv2.CV_32FC1)
    iml = cv2.remap(iml, mapl1, mapl2, cv2.INTER_LINEAR)
    imr = cv2.remap(imr, mapr1, mapr2, cv2.INTER_LINEAR)
    return iml, imr


#newcameramtx_left, dist_left, objpoints_left, imgpoints_left, gray_left = undistorting_left_img()
#newcameramtx_right, dist_right, objpoints_right, imgpoints_right, gray_right = undistorting_right_img()

#calLinesAll()



#ret, mtx1, dist1, mtx2, dist2, R, T, E, F = cv2.stereoCalibrate(objpoints, imgpoints_left, imgpoints_right, newcameramtx_left, dist_left, newcameramtx_right, dist_right, gray_left.shape[::-1], flags=cv2.CALIB_FIX_INTRINSIC) 
ret, mtx1, dist1, mtx2, dist2, R, T, E, F = cv2.stereoCalibrate(objpoints, imgpl, imgpr, mtx1, dist1, mtx2, dist2, gray.shape[::-1], flags=cv2.CALIB_FIX_INTRINSIC)

def stereoRectify(iml, imr):
    R1, R2, P1, P2, Q, roi1, roi2 = cv2.stereoRectify(mtx1, dist1, mtx2, dist2, gray.shape[::-1],R, T)
    undis_img_sizel = iml.shape[:2]
    undis_img_sizel = undis_img_sizel[::-1]
    undis_img_sizer = imr.shape[:2]
    undis_img_sizer = undis_img_sizer[::-1]
    mapl1, mapl2 = cv2.initUndistortRectifyMap(mtx1, dist1, R1, P1, undis_img_sizel, cv2.CV_32FC1)
    mapr1, mapr2 = cv2.initUndistortRectifyMap(mtx2, dist2, R2, P2, undis_img_sizer, cv2.CV_32FC1)
    iml = cv2.remap(iml, mapl1, mapl2, cv2.INTER_LINEAR)
    imr = cv2.remap(imr, mapr1, mapr2, cv2.INTER_LINEAR)
    return iml, imr
rec_left = []
rec_right = []
for iml, imr in zip(img_left, img_right):
    iml, imr = stereoRectify(iml, imr)
    rec_left.append(iml)
    rec_right.append(imr)
# take 15 for example
calLines(rec_left[1], rec_right[1], 300, True)