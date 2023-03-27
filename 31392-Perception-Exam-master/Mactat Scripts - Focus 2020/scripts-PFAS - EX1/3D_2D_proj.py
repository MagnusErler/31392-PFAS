import numpy as np

# Position of the camera in the world
camera_pos = [0, 0, 0]

# Rotation of the camera in the world
rot_mat = [[1, 0, 0],
[0, 1, 0],
[0, 0, 1]]

# Define camera matrix
# camera matrix ->
# [fx, 0, cx]
# [0, fy, cy]
# [0, 0, 1]
camera_mat = [[725, 0, 631, camera_pos[0]],
[0, 726, 360, camera_pos[1]],
[0, 0, 1, camera_pos[2]]]

# Point of interest
X,Y,Z = 1,1,4
pos_glob = [X,Y,Z,1]

# Find position in camera coordinates
pos_cam = np.dot(np.dot(rot_mat,camera_mat),pos_glob)
print(f"x, y = {pos_cam[:2]/pos_cam[2]}")