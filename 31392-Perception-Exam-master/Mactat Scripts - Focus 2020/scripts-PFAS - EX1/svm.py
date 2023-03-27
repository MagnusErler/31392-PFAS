'''
- Train and test a Support Vector Machine (SVM).
- Find proportion of the original dataset is used for training
- Apply a SVM as instructed in the provided code. What is the reported accuracy of your SVM (APPROXIMATELY)?
'''

from sklearn.model_selection import train_test_split
import numpy as np
from sklearn import svm
from sklearn import metrics

# Parameters
data_path_x = './data/svm/svm_x.txt'
data_path_y = './data/svm/svm_y.txt'

# Load data
x = np.loadtxt(data_path_x, dtype=float)
y = np.loadtxt(data_path_y, dtype=int)

# Split data into training and test sets
X_train, X_test, y_train, y_test = train_test_split(x, y, test_size=0.3, random_state=1337)
print(f"Propotion used for training: {len(X_train)*100/len(x):.1f}%")

# Apply SVM with Linear Kernel
clf = svm.SVC(kernel='linear')
clf.fit(X_train, y_train)
y_pred = clf.predict(X_test)
print(f"Accuracy: {metrics.accuracy_score(y_test, y_pred):.2f}")