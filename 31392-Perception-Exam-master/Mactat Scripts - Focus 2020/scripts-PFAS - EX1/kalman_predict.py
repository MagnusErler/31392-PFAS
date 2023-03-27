'''
 - You are tracking an object with a Kalman filter. At the current time the state is:
    x = 3
    x_dot = 0.5
    y = 2
    y_dot = 0.33
    and the current covariance is:
    [[5,1,0,0],
    [1,2,0,0],
    [0,0,5,1],
    [0,0,1,2]]
- x and y being the position in the x and y direction and x_dot, y_dot being the velocities in the x and y direction.
- We assume the object follows a constant velocity model and that there are no external forces (u=0) and no process noise.
- find next predicted state and the next predicted covariance?
'''
import numpy as np
from filterpy.kalman import KalmanFilter

# Parameters
state_dim = 4
state = np.array([[3],   # x
                [0.5],   # velocity x
                [2],     # y
                [0.33]]) # velocity y
covariance = np.array([[5, 1, 0, 0],
                        [1, 2, 0, 0],
                        [0, 0, 5, 1],
                        [0, 0, 1, 2]])
delta_t = 1
state_transition_matrix = np.array([[1, delta_t, 0, 0],
                                    [0, 1, 0, 0],
                                    [0, 0, 1, delta_t],
                                    [0, 0, 0, 1]])
noise = np.zeros((state_dim, state_dim))

# Create kalman filter
kalman = KalmanFilter (dim_x=state_dim, dim_z=2)

# initialize
kalman.x = state

# state trasition matrix - is it correct?
kalman.F = state_transition_matrix

# oise
kalman.Q = noise

# covariance matrix
kalman.P = covariance

kalman.predict()
print(f"state\n{kalman.x}\n\ncovariance\n{kalman.P}")