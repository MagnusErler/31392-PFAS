import cv2
import glob
import numpy as np

def calibrate_camera(path):
    # termination criteria
    criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 30, 0.001)
    # prepare object points, like (0,0,0), (1,0,0), (2,0,0) ....,(6,5,0)
    objp = np.zeros((7*5,3), np.float32)
    objp[:,:2] = np.mgrid[0:7,0:5].T.reshape(-1,2)
    # Arrays to store object points and image points from all the images.
    objpoints = [] # 3d point in real world space
    imgpoints = [] # 2d points in image plane.

    images = glob.glob('images_found/*.png')

    for fname in images:
        img = cv2.imread(fname)
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        # Find the chess board corners
        ret, corners = cv2.findChessboardCorners(gray, (7,5), None)

        if ret == True:

            objpoints.append(objp)

            corners2 = cv2.cornerSubPix(gray,corners, (4,4), (-1,-1), criteria)
            imgpoints.append(corners2)
    
    # Draw and display the corners
            img = cv2.drawChessboardCorners(img, (7,5), corners2,ret)
            cv2.imshow('Chessboard',img)
            cv2.waitKey(0)
        cv2.destroyAllWindows()

    ret, mtx, dist, rvecs, tvecs = cv2.calibrateCamera(objpoints, imgpoints, gray.shape[::-1], None, None)

    return ret, mtx, dist, rvecs, tvecs

def save_coefficients(mtx, dist, rvecs, tvecs, path):
    """ Save the camera matrix and the distortion coefficients to given path/file. """
    cv_file = cv2.FileStorage(path, cv2.FILE_STORAGE_WRITE)
    cv_file.write("K", mtx)
    cv_file.write("D", dist)
    # note you *release* you don't close() a FileStorage object
    cv_file.release()

def load_coefficients(path):
    """ Load the camera matrix and the distortion coefficients from given path/file. """
    cv_file = cv2.FileStorage(path, cv2.FILE_STORAGE_READ)
    camera_matrix = cv_file.getNode("K").mat()
    dist_matrix = cv_file.getNode("D").mat()
    cv_file.release()
    return camera_matrix, dist_matrix


def getOptimalCameraMatrix(mtx, dist, img):
    h,w = img.shape[:2]
    newcameramtx, roi = cv2.getOptimalNewCameraMatrix(mtx, dist, (w, h), 1, (w, h))

    return newcameramtx, roi

newcameramtx, roi = cv2.getOptimalNewCameraMatrix(mtx,dist,(w,h),1,(w,h))
def show_calibrated_image_with_optimal_camera_matrix(path):
    img = cv2.imread(path)
    mtx, dist = load_coefficients('calibration.yaml')
    newcameramtx, roi = getOptimalCameraMatrix(mtx, dist, img)
    dst = cv2.undistort(img, mtx, dist, None, newcameramtx)

    cv2.imshow('Calibrated Image', dst)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

def show_calibrated_image(path):
    img = cv2.imread(path)
    mtx, dist = load_coefficients('calibration.yaml')
    dst = cv2.undistort(img, mtx, dist, None, mtx)

    cv2.imshow('Calibrated Image', dst)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

""" def getOptimalCameraMatrix(mtx, dist, img):
    h,w = img.shape[:2]
    newcameramtx, roi = cv2.getOptimalNewCameraMatrix(mtx, dist, (w, h), 1, (w, h))
    mapx, mapy = cv2.initUndistortRectifyMap(mtx, dist, None, newcameramtx, (w,h), 5)
    image = cv2.remap(img, mapx, mapy, cv2.INTER_LINEAR)

    x, y, w, h = roi
    image = image[y:y + h, x:x + w]

    return image """