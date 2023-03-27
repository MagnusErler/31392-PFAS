import numpy as np

# Input
A = np.array([[10, 15, 20],
            [20, 20, 25],
            [10, 15, 20]])

B = np.array([[15, 15, 15],
            [20, 20, 20],
            [30, 30, 30]])

# Disimilarity function

# Sum of absolute differences
sum_of_abs = lambda A, B: np.sum(np.abs(A - B))

# Sum of squared differences
sum_of_sq = lambda A, B: np.sum((A - B)**2)

# Print disimilarity between A and B
print(sum_of_sq(A, B))