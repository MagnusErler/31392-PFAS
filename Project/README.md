# 34759 Perception for Autonomous Systems - Final project

In this folder you will find:

- Three recorded sequences of pedestrian, cyclists and cars.
- A sequence for camera calibration.

## Data format

Each sequence folder contains the following structure:
```
seq_<n>/
|
|____image02/
|    |____data/
|         |_ <image_seq_no>.png
|    |_ timestamps.txt
|
|
|____image03/
|    |____data/
|         |_ <image_seq_no>.png
|    |_ timestamps.txt
```

- image_02/data/ contains the left color camera sequence images (png)
- image_02/timestamps.txt timestamps for each left image, the first line being for the first image, the second line for the second, and so on.
- image_03/data/ contains the right color camera sequence images  (png)
- image_03/timestamps.txt timestamps for each right image
- labels.txt contains the ground truth labels that can be used to evaluate your solution. **Note that we do not provide the labels for sequence 03.**

The labels files contain the following information. All values (numerical or strings) are separated via spaces, each row corresponds to one object. The 17 columns represent:

|Values  |  Name    |  Description
|--------|----------|--------------------------------------------------------
|   1    | `frame`    |  Frame within the sequence where the object appearers
|   1    | `track id` |  Unique tracking id of this object within this sequence
|   1    | `type`     |  Describes the type of object: `Car`,`Pedestrian`, `Cyclist`
|   1    | `truncated`|  Float from 0 (non-truncated) to 1 (truncated), where truncated refers to the object leaving image boundaries.
|   1    | `occluded` | Integer (0,1,2,3) indicating occlusion state: 0 = fully visible, 1 = partly occluded, 2 = largely occluded, 3 = unknown
|   1    | `alpha`    | Observation angle of object, ranging $[-\pi;\pi]$
|   **4**    | `bbox`     | 2D bounding box of object in the **Rectified image** (0-based index): contains left, top, right, bottom pixel coordinates
|   **3**   |`dimensions`| 3D object dimensions: height, width, length (in meters)
|  **3**    | `location` | 3D object location $x,y,z$ in camera coordinates (in meters)
|   1    |`rotation_y`| Rotation $r_y$ around Y-axis in camera coordinates $[-\pi;\pi]$
|   1    | `score`   | Only for results: Float, indicating confidence in detection, needed for p/r curves, higher is better.

**Please note that the 2D bounding box provided is given with respect to rectified image coordinates.** 


calib_cam_to_cam.txt: Camera-to-camera calibration
--------------------------------------------------

  - S_xx: 1x2 size of image xx before rectification
  - K_xx: 3x3 calibration matrix of camera xx before rectification
  - D_xx: 1x5 distortion vector of camera xx before rectification
  - R_xx: 3x3 rotation matrix of camera xx (extrinsic)
  - T_xx: 3x1 translation vector of camera xx (extrinsic)
  - S_rect_xx: 1x2 size of image xx after rectification
  - R_rect_xx: 3x3 rectifying rotation to make image planes co-planar
  - P_rect_xx: 3x4 projection matrix after rectification
