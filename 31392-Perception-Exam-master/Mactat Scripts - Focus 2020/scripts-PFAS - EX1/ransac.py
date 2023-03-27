'''
- Formula k = log(1-p)/(log(1-w^2))
- k is the number of iterations, p is the probability of RANSAC having chosen a
  set of points free of outliers, w is the proportion of inliers with respect to all the points in the dataset.
a)
- probability of success at least 98% 
- 75% of the points are inliers
- find the number of iterations 
b)
How would the number of needed iterations change if the size of our dataset(number of points)
'''
import numpy as np

# Parameters
p = 0.98
w = 0.75

def num_iterations(p, w):
    # Round number of iterations to the nearest integer(up)
    n_iter = np.ceil(np.log(1-p)/np.log(1-w**2))
    return n_iter

print(f"Number of iterations: {num_iterations(p, w)}")