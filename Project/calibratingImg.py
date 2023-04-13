import os
import cv2
import numpy as np
import glob
import re
import matplotlib.pyplot as plt

def save_coefficients(mtx, dist, path):
    """ Save the camera matrix and the distortion coefficients to given path/file. """
    cv_file = cv2.FileStorage(path, cv2.FILE_STORAGE_WRITE)
    cv_file.write("K", mtx)
    cv_file.write("D", dist)
    # note you *release* you don't close() a FileStorage object
    cv_file.release()

def calibrate_camera(path, camera_calibration_file):
    # Implement the number of vertical and horizontal corners
    nb_vertical = 5
    nb_horizontal = 7
    i =0
    picture_number = 0
    # Arrays to store object points and image points from all the images.
    objpoints = [] # 3d point in real world space
    imgpoints = [] # 2d points in image plane.

    criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 30, 0.001)
    # Defining the world coordinates for 3D points
    objp = np.zeros((1, nb_vertical * nb_horizontal, 3), np.float32)
    objp[0,:,:2] = np.mgrid[0:nb_vertical, 0:nb_horizontal].T.reshape(-1, 2)

    # Extracting path of individual image stored in a given directory
    images = glob.glob(path + '/*.png')
    assert images
    image_paths_sorted = sorted(images, key=lambda i: int(os.path.splitext(os.path.basename(i))[0]))
    
    for fname in image_paths_sorted:

        # Lars' code (Path cannot inlcude numbers)
        picture_number = int(re.sub('\D', '', str(image_paths_sorted[i])))
        i +=1 

        img = cv2.imread(fname)
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

        # Implement findChessboardCorners here
        ret, corners = cv2.findChessboardCorners(gray, (nb_vertical,nb_horizontal), cv2.CALIB_CB_ADAPTIVE_THRESH + cv2.CALIB_CB_FAST_CHECK + cv2.CALIB_CB_NORMALIZE_IMAGE)

        # If found, add object points, image points (after refining them)
        if ret == True:
            objpoints.append(objp)

            # refining pixel coordinates for given 2d points.
            corners2 = cv2.cornerSubPix(gray, corners, (11,11),(-1,-1), criteria)
            
            imgpoints.append(corners2)
    
            # Draw and display the corners
            img = cv2.drawChessboardCorners(img, (nb_vertical,nb_horizontal), corners2, ret)

        # Insert text into image
        #font = cv2.FONT_HERSHEY_SIMPLEX
        #cv2.putText(img, 'Picture {}'.format(picture_number), (10, 30), font, 1, (255, 0, 0), 2, cv2.LINE_AA)
        #cv2.imshow('image', img)
        #cv2.waitKey(100)

    cv2.destroyAllWindows()

    ret, mtx, dist, rvecs, tvecs = cv2.calibrateCamera(objpoints, imgpoints, gray.shape[::-1], None, None)

    # Save camera matrix and distortion coefficients
    #np.savez(camera_calibration_file + ".npz", mtx=mtx, dist=dist, rvecs=rvecs, tvecs=tvecs)
    save_coefficients(mtx, dist, camera_calibration_file + ".yaml")

    return mtx, dist

def undistort_image(path, mtx, dist):
    # Extracting path of individual image stored in a given directory
    images = glob.glob(path + '/*.png')
    assert images
    image_paths_sorted = sorted(images, key=lambda i: int(os.path.splitext(os.path.basename(i))[0]))
    print(image_paths_sorted)
    i=0
    for fname in image_paths_sorted:
        picture_number = int(re.sub('\D', '', str(image_paths_sorted[i])))
        i+=1
        img = cv2.imread(fname)
        h,  w = img.shape[:2]
        newcameramtx, roi = cv2.getOptimalNewCameraMatrix(mtx, dist, (w,h), 1, (w,h))

        # undistort
        dst = cv2.undistort(img, mtx, dist, None, newcameramtx)

        # crop the image
        x, y, w, h = roi
        dst = dst[y:y+h, x:x+w]
        #cv2.imwrite('calibresult.png', dst)

        #cv2.imshow('img', dst)
        #cv2.waitKey(100)

        font = cv2.FONT_HERSHEY_SIMPLEX
        cv2.putText(dst, 'Picture {}'.format(picture_number), (10, 30), font, 1, (255, 0, 0), 2, cv2.LINE_AA)
        cv2.imshow('image', dst)
        #cv2.imwrite('calibresult.png', dst)
        cv2.waitKey(100)

        # Show images side by side
        plt.subplot(121),plt.imshow(img)
        plt.subplot(122),plt.imshow(dst)
        plt.show()



if __name__ == '__main__':

    mtx, dist = calibrate_camera("calib/image_L/data/data_masked", "calib/camera_calibration_L")
    #calibrate_camera("calib/image_R/data", "calib/camera_calibration_R")

    undistort_image("seq_01/image_L/data", mtx, dist)

    
 