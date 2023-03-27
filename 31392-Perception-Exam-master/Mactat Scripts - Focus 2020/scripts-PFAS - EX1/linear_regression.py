'''
- Apply Linear Regression to the provided data to obtain a model of the form  y=ax+b 
- Print "a" and "b" in that model (APPROXIMATELY)
'''
from sklearn.linear_model import LinearRegression
import numpy as np

# Parameters
data_path_x = './data/linear_regression/lr_x.txt'
data_path_y = './data/linear_regression/lr_y.txt'

# Load data
x = np.loadtxt(data_path_x, dtype=float)
y = np.loadtxt(data_path_y, dtype=float)
x_reshaped = x.reshape(-1, 1) #fit needs data in this shape
lm = LinearRegression()
model = lm.fit(x_reshaped, y)

# Print coefficients
print(f"a = {model.coef_[0]:.2f}")
print(f"b = {model.intercept_:.2f}")
