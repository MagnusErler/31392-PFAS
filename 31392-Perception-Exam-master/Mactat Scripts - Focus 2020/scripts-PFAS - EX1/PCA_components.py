'''
Perform PCA on the provided dataset and determine the minimum number of
components required to express 95% of the variance.
'''
import numpy as np
from sklearn.decomposition import PCA

# Parameters
data_path = './data/k_means_and_pca/clusters.txt'
pct_variance = 0.95

# Load data
X = np.loadtxt(data_path, dtype=int)

# Perform PCA
pca = PCA(n_components=None)
pca.fit(X)

# print components variance
pca_cumsum = np.cumsum(pca.explained_variance_ratio_)
print(f"Variance: {pca_cumsum}")

# Find number of components required to express 95% of the variance
num_components = np.argmax(pca_cumsum >= pct_variance) + 1
print(f"Number of components needed to explain {pct_variance} fo data: {num_components}")
