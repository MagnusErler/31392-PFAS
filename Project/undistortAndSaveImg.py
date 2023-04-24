import cv2
import glob

pathCamMtx = "calib/camera_calibration_R.yaml"
pathImg = "seq_03/image_03_right/data/*.png"
pathSave = "seq_03/image_03_right/undistorted/"

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

camera_matrix, dist_matrix = load_coefficients(pathCamMtx)

images = glob.glob(pathImg)

for fname in images:
    img = cv2.imread(fname)
    dst = undistort(img, camera_matrix, dist_matrix)
    cv2.imwrite(pathSave + fname[20:], dst)
    
    cv2.imshow("Original image", img)
    cv2.imshow("Undistorted image", dst)
    cv2.waitKey(10)
cv2.destroyAllWindows()