'''
- PCA transformed data(SUB-QUESTION B)
- Perform K-means(SUB-QUESTION A)
- Calculate the Inertia (sumof squared differences of samples to the closest centroid)
'''

import numpy as np
from sklearn.cluster import KMeans
from sklearn.decomposition import PCA

# Parameters
data_path = './data/k_means_and_pca/clusters.txt'
pct_variance = 0.95
K_options = [5,6] # (SUB-QUESTION A)

# Load data
X = np.loadtxt(data_path, dtype=int)

# Perform PCA
pca = PCA(n_components=None)
pca.fit(X)

pca_cumsum = np.cumsum(pca.explained_variance_ratio_)

# Find number of components required to express 95% of the variance
num_components = np.argmax(pca_cumsum >= pct_variance)

# Trim number of components
X_trim = pca.transform(X)[:, :num_components]

# K means
for K in K_options:
    # Perform K-means
    kmeans = KMeans(n_clusters=K)
    kmeans.fit(X_trim)
    # Calculate the Inertia (sumof squared differences of samples to the closest centroid)
    inertia = kmeans.inertia_
    print(f"Inertia for K={K}: {inertia}")

