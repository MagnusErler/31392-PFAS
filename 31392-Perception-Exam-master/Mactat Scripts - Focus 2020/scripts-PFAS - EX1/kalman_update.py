'''
- constant velocity model (for state transition matrix)
    x = 5
    x_dot =  0.5
    y = 7
    y_dot =  0.8
    covariance = [[0.2, 0.0, 0.0, 0.0],
                [0.2, 0.1, 0.0, 0.0],
                [0.0, 0.0, 0.2, 0.0],
                [0.0, 0.0, 0.2, 0.1]]
- Measured the position of the object to be:
    x = 4.8
    y = 7.1
- Noise R:
    noise = [[0.2, 0.2],
            [0.2, 0.2]]
- Find state after update step(just update)
'''

import numpy as np
from filterpy.kalman import KalmanFilter

# Parameters
state_dim = 4

state = np.array([[5],   # x
                [0.5],   # velocity x
                [7],     # y
                [0.8]])  # velocity y

measurement = np.array([[4.8],[7.1]]) # x , y
meas_dim = len(measurement)
covariance = np.array([[0.2, 0.0, 0.0, 0.0],
                        [0.2, 0.1, 0.0, 0.0],
                        [0.0, 0.0, 0.2, 0.0],
                        [0.0, 0.0, 0.2, 0.1]])
delta_t = 1
state_transition_matrix = np.array([[1, delta_t, 0, 0],
                                    [0, 1, 0, 0],
                                    [0, 0, 1, delta_t],
                                    [0, 0, 0, 1]])

noise = np.zeros((state_dim, state_dim))
R = np.array([[0.2, 0.2],
                [0.2, 0.2]])

measurement_f = np.array([[1, 0, 0, 0], # x
                        [0, 0, 1, 0]])  # y

# Create kalman filter
kalman = KalmanFilter (dim_x=state_dim, dim_z=meas_dim)

# initialize
kalman.x = state

# state trasition matrix - is it correct?
kalman.F = state_transition_matrix

# oise
kalman.Q = noise

# measurement function
kalman.H = measurement_f

# covariance matrix
kalman.P = covariance

kalman.R = R
kalman.update(measurement)
print(f"state\n {kalman.x }\n\ncovariance\n{kalman.P}")