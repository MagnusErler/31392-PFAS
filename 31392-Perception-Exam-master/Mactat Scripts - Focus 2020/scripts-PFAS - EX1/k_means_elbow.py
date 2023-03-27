'''
- Use the elbow method to find how many clusters are optimal for this dataset.
- Plot will be saved instead of shown on screen.
'''
from sklearn.cluster import KMeans 
import numpy as np
import matplotlib.pyplot as plt

# Parameters
K_option = [3,4,5,6]

# Loading the data
X = np.loadtxt('./data/k_means_and_pca/clusters.txt', dtype=int)

distortions = []
for k in K_option:
    kmeans = KMeans(n_clusters=k)
    kmeans.fit(X)
    # save score
    score = kmeans.score(X)
    distortions.append(kmeans.inertia_)

# Elbow method
# k nums which are shown after the steep curve are the solutions
plt.figure(figsize=(16,8))
plt.plot(K_option, distortions, 'bx-')
plt.xlabel('k')
plt.ylabel('Distortion')
plt.title('The Elbow Method showing the optimal k')
plt.savefig('./data/k_means_and_pca/elbow.png')