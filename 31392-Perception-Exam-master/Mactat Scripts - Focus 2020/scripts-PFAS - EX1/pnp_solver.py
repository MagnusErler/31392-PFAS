import numpy as np
import cv2

def find_in_world(rvec, tvec, X):
    # What would be the the location of the  interest point P in world coordinates?
    rot_mat, _= cv2.Rodrigues(rvec)
    t = -rot_mat.T.dot(tvec.T) 

    camera_mat = np.hstack((rot_mat.T, t))
    pos_glob = [*X,1]
    pos_cam = np.dot(camera_mat, pos_glob)
    np.set_printoptions(precision=2)
    print(f"X, Y, Z = {pos_cam}")
    return pos_cam

# ============================================================= Testing =============================
# Rt
rvec = np.array([-0.05, -1.51, -0.00], dtype="float")
tvec = np.array([[87.39, -2.25, -24.89]])

# Position in camera coordinates
X= np.array([-6.71, 0.23, 21.59])

pos_cam = find_in_world(rvec, tvec, X)
np.testing.assert_almost_equal([40.71, -1.98, 96.75], pos_cam, decimal=2)

