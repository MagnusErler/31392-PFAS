

import yaml

# Loading camera-calibratin files from calib folder

path = "calib/camera_calibration_L.yaml"

# get camera matrix and distortion coefficients
with open(path) as f:
    loadeddict = yaml.load(f)
    mtx = loadeddict.get('camera_matrix')
    dist = loadeddict.get('dist_coeff')

# print camera matrix and distortion coefficients
print("Camera matrix: ", mtx)
print("Distortion coefficients: ", dist)




