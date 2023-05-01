import cv2
import glob

pathCamMtxL = "calib/camera_calibration_L.yaml"
pathCamMtxR = "calib/camera_calibration_R.yaml"

pathImgSeq1L = "seq_01/image_L/data/*.png"
pathImgSeq2L = "seq_02/image_02_left/data/*.png"
pathImgSeq3L = "seq_03/image_02_left/data/*.png"

pathImgSeq1R = "seq_01/image_R/data/*.png"
pathImgSeq2R = "seq_02/image_03_right/data/*.png"
pathImgSeq3R = "seq_03/image_03_right/data/*.png"

pathSaveSeq1L = "seq_01/image_L/undistorted/"
pathSaveSeq2L = "seq_02/image_02_left/undistorted/"
pathSaveSeq3L = "seq_03/image_02_left/undistorted/"

pathSaveSeq1R = "seq_01/image_R/undistorted/"
pathSaveSeq2R = "seq_02/image_03_right/undistorted/"
pathSaveSeq3R = "seq_03/image_03_right/undistorted/"

def load_coefficients(path):
    """ Loads camera matrix and distortion coefficients. """
    # FILE_STORAGE_READ
    cv_file = cv2.FileStorage(path, cv2.FILE_STORAGE_READ)

    # note we also have to specify the type to retrieve other wise we only get a
    # FileNode object back instead of a matrix
    camera_matrix = cv_file.getNode("K").mat()
    dist_matrix = cv_file.getNode("D").mat()

    cv_file.release()
    return [camera_matrix, dist_matrix]

def undistort(img, camera_matrix, dist_matrix):
    """ Undistort image using camera matrix and distortion coefficients. """
    h, w = img.shape[:2]
    newcameramtx, roi = cv2.getOptimalNewCameraMatrix(camera_matrix, dist_matrix, (w, h), 1, (w, h))

    # undistort
    dst = cv2.undistort(img, camera_matrix, dist_matrix, None, newcameramtx)

    # crop the image
    x, y, w, h = roi
    dst = dst[y:y+h, x:x+w]
    return dst

camera_matrix_L, dist_matrix_L = load_coefficients(pathCamMtxL)
camera_matrix_R, dist_matrix_R = load_coefficients(pathCamMtxR)

images_seq1L = glob.glob(pathImgSeq1L)
images_seq2L = glob.glob(pathImgSeq2L)
images_seq3L = glob.glob(pathImgSeq3L)

images_seq1R = glob.glob(pathImgSeq1R)
images_seq2R = glob.glob(pathImgSeq2R)
images_seq3R = glob.glob(pathImgSeq3R)

for fname in images_seq1L:
    img = cv2.imread(fname)
    dst = undistort(img, camera_matrix_L, dist_matrix_L)
    cv2.imwrite(pathSaveSeq1L + "u" + fname[20:], dst)
    
    cv2.imshow("Original image", img)
    cv2.imshow("Undistorted image", dst)
    cv2.waitKey(1)
cv2.destroyAllWindows()

for fname in images_seq2L:
    img = cv2.imread(fname)
    dst = undistort(img, camera_matrix_L, dist_matrix_L)
    cv2.imwrite(pathSaveSeq2L + "u" + fname[26:], dst)
    
    cv2.imshow("Original image", img)
    cv2.imshow("Undistorted image", dst)
    cv2.waitKey(1)
cv2.destroyAllWindows()

for fname in images_seq3L:
    img = cv2.imread(fname)
    dst = undistort(img, camera_matrix_L, dist_matrix_L)
    cv2.imwrite(pathSaveSeq3L + "u" + fname[26:], dst)
    
    cv2.imshow("Original image", img)
    cv2.imshow("Undistorted image", dst)
    cv2.waitKey(1)
cv2.destroyAllWindows()

for fname in images_seq1R:
    img = cv2.imread(fname)
    dst = undistort(img, camera_matrix_R, dist_matrix_R)
    cv2.imwrite(pathSaveSeq1R + "u" + fname[20:], dst)
    
    cv2.imshow("Original image", img)
    cv2.imshow("Undistorted image", dst)
    cv2.waitKey(1)
cv2.destroyAllWindows()

for fname in images_seq2R:
    img = cv2.imread(fname)
    dst = undistort(img, camera_matrix_R, dist_matrix_R)
    cv2.imwrite(pathSaveSeq2R + "u" + fname[27:], dst)
    
    cv2.imshow("Original image", img)
    cv2.imshow("Undistorted image", dst)
    cv2.waitKey(1)
cv2.destroyAllWindows()

for fname in images_seq3R:
    img = cv2.imread(fname)
    dst = undistort(img, camera_matrix_R, dist_matrix_R)
    cv2.imwrite(pathSaveSeq3R + "u" + fname[27:], dst)
    
    cv2.imshow("Original image", img)
    cv2.imshow("Undistorted image", dst)
    cv2.waitKey(1)
cv2.destroyAllWindows()