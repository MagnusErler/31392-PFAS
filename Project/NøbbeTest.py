import matplotlib.pyplot as plt
import numpy as np
import time
import datetime as dt
from sklearn.decomposition import PCA
from sklearn import datasets, svm, metrics
from sklearn.datasets import fetch_openml
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score
from sklearn.metrics import precision_score
from sklearn.metrics import recall_score
from sklearn.metrics import f1_score
import pandas as pd
from sklearn.svm import SVC
import cv2
import os
from PIL import Image
import json

# Read the file into a DataFrame: df
# seq_1 = pd.read_csv(r"C:\Users\larsd\OneDrive - Danmarks Tekniske Universitet\DTU\Kandidat 4. Semester\34759 Perception for Autonomous Systems\GitHub\31392-PFAS\Project\seq_01\labels.txt", sep=" ",
#                     names=["frame", "track_id", "type", "truncated", "occluded", "alpha", "bbox_0", "bbox_1", "bbox_2", "bbox_3", "dimensions_height", "dimensions_width", "dimensions_length", "location_x", "location_y", "location_z", "rotation_y", "score"])
# seq_2 = pd.read_csv(r"C:\Users\larsd\OneDrive - Danmarks Tekniske Universitet\DTU\Kandidat 4. Semester\34759 Perception for Autonomous Systems\GitHub\31392-PFAS\Project\seq_02\labels.txt", sep=" ",
#                     names=["frame", "track_id", "type", "truncated", "occluded", "alpha", "bbox_0", "bbox_1", "bbox_2", "bbox_3", "dimensions_height", "dimensions_width", "dimensions_length", "location_x", "location_y", "location_z", "rotation_y", "score"])

# Print every columen with track_id == 1)
#print(seq_1.loc[seq_1['track_id'] == 1])

# Training Dataset: The sample of data used to fit the model.
# Validation Dataset: The sample of data used to provide an unbiased evaluation of a model fit on the training dataset while tuning model hyperparameters => Seq 01, 02
# Test Dataset: The sample of data used to provide an unbiased evaluation of a final model fit on the training dataset => Seq 03

"""
Fremgangsmåde:
Vi træner modellen på training data, evaluerer den på test data, og endeligt kan vi bruge den på unseen validation data
"""

# Paths to datasets: training, validation, and testing
TrainPath = r"C:\Users\larsd\OneDrive - Danmarks Tekniske Universitet\DTU\Kandidat 4. Semester\34759 Perception for Autonomous Systems\GitHub\31392-PFAS\Project\Caltech_Export\set00\V000"
ValidationPath = r"C:\Users\larsd\OneDrive - Danmarks Tekniske Universitet\DTU\Kandidat 4. Semester\34759 Perception for Autonomous Systems\GitHub\31392-PFAS\Project\seq_01"
TestingPath = r"C:\Users\larsd\OneDrive - Danmarks Tekniske Universitet\DTU\Kandidat 4. Semester\34759 Perception for Autonomous Systems\GitHub\31392-PFAS\Project\seq_03"

# Load the training data
training_data = []
for img in os.listdir(os.path.join(TrainPath, 'images')):
    img_path = os.path.join(TrainPath, 'images', img)
    img_array = cv2.imread(img_path)
    #print(os.path.join(TrainPath, 'annotations', img.split('.')[0] + '.json'))
    with open(os.path.join(TrainPath, 'annotations', img.split('.')[0] + '.json'), 'r') as f:
        data = json.load(f)
        if data == []:
            continue
        else:
            for i in range(len(data)):
                label = data[i]['pos']
                id = data[i]['id']
                training_data.append([img_array, label, id])
            #print(f"Image {img} and length {len(data)}")
            #label = data[0]['pos']
            #id = data[0]['id']
            #print(f"")
    #training_data.append([img_array, label, id])
print(f"Image {img} and label {label} and id {id}")

# Load the validation data
validation_data = []
with open(os.path.join(ValidationPath, 'labels.txt'), 'r') as f:
    for line in f.readlines():
        elements = line.split(' ')
        img = elements[0]
        label = [elements[6], elements[7], elements[8], elements[9]]
        id = elements[1] 
        img_array = os.path.join(ValidationPath,'image_L', 'undistorted', img.zfill(10) + '.png')
        img = cv2.imread(img_array)
        #label = int(label)
        validation_data.append([img, label, id])
        
# Preprocess the data
def preprocess_data(data):
    processed_data = []
    for img, label, id in data:
        img = cv2.resize(img, (224, 224))
        img = img.astype(np.float32) / 255.
        processed_data.append((img, label, id))
    return processed_data

train_data = preprocess_data(training_data)
val_data = preprocess_data(validation_data)
# test_data = preprocess_data(testing_data)

# Extract features from the data
def extract_features(data):
    features = []
    for img, label, id in data:
        # Use the ID and Position (bounding box) to extract the pedestrian image
        x1, y1, x2, y2 = label
        pedestrian_img = img[y1:y2, x1:x2]
        pedestrian_img = cv2.resize(pedestrian_img, (224, 224))
        pedestrian_img = pedestrian_img.astype(np.float32) / 255.
        features.append(pedestrian_img.ravel())
    return np.array(features)

train_features, train_labels = extract_features(train_data), [x[2] for x in train_data]
val_features, val_labels = extract_features(val_data), [x[2] for x in val_data]
#test_features, test_timestamps = extract_features(test_data), [x[1] for x in test_data]

# Train a machine learning model on the extracted features
# Here, we use a Random Forest classifier as an example
model = RandomForestClassifier(n_estimators=100, max_depth=10)
model.fit(train_features, train_labels)

# Evaluate the model on the validation set
val_preds = model.predict(val_features)
val_acc = accuracy_score(val_labels, val_preds)
val_prec = precision_score(val_labels, val_preds)
val_rec = recall_score(val_labels, val_preds)
val_f1 = f1_score(val_labels, val_preds)
print('Validation accuracy: {:.2f}'.format(val_acc))
print('Validation precision: {:.2f}'.format(val_prec))
print('Validation recall: {:.2f}'.format(val_rec))
print('Validation F1 score: {:.2f}'.format(val_f1))
