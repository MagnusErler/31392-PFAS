import matplotlib.pyplot as plt
import numpy as np
import os
import PIL
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
from tensorflow.keras.models import Sequential
import pathlib
import pandas as pd
from PIL import Image 
from PIL.ImageDraw import Draw
import cv2
import json


train_images = []
train_targets = []
train_labels = []

validation_images = []
validation_targets = []
validation_labels = []

TrainPath = "/home/mrarnoldi/Desktop/Caltech_Export/set00/V000/"
ValidationPath = "/home/mrarnoldi/Desktop/seq_01/"
TestingPath = "/home/mrarnoldi/Desktop/seq_03/"

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
                target = data[i]['pos']
                id = data[i]['id']
                label = data[i]['lbl']
                #training_data.append([img_array, label, id])
                train_images.append(img_array)
                
                train_targets.append((target[0], target[1], target[2], target[3]))
                train_labels.append(label)

#print(f"Image {img} and label {label} and id {id}")

# Load the validation data
validation_data = []
with open(os.path.join(ValidationPath, 'labels.txt'), 'r') as f:
    for line in f.readlines():
        elements = line.split(' ')
        img = elements[0]
        target = (elements[6], elements[7], elements[8], elements[9])
        id = elements[1] 
        label = elements[2]
        img_array = os.path.join(ValidationPath,'image_L', 'undistorted', img.zfill(10) + '.png')
        img = cv2.imread(img_array)
        #label = int(label)
        #validation_data.append([img, label, id])
        validation_images.append(img)
        validation_targets.append(target)
        validation_labels.append(label)


train_images = np.array(train_images)
train_targets = np.array(train_targets)
train_labels = np.array(train_labels)
validation_images = np.array(validation_images)
validation_targets = np.array(validation_targets)
validation_labels = np.array(validation_labels)

width = 640
height = 480
num_classes = 1
classes = ["Person"]

#create the common input layer
input_shape = (height, width, 3)
input_layer = tf.keras.layers.Input(input_shape)

#create the base layers
base_layers = layers.experimental.preprocessing.Rescaling(1./255, name='bl_1')(input_layer)
base_layers = layers.Conv2D(16, 3, padding='same', activation='relu', name='bl_2')(base_layers)
base_layers = layers.MaxPooling2D(name='bl_3')(base_layers)
base_layers = layers.Conv2D(32, 3, padding='same', activation='relu', name='bl_4')(base_layers)
base_layers = layers.MaxPooling2D(name='bl_5')(base_layers)
base_layers = layers.Conv2D(64, 3, padding='same', activation='relu', name='bl_6')(base_layers)
base_layers = layers.MaxPooling2D(name='bl_7')(base_layers)
base_layers = layers.Flatten(name='bl_8')(base_layers)

#create the classifier branch
classifier_branch = layers.Dense(128, activation='relu', name='cl_1')(base_layers)
classifier_branch = layers.Dense(num_classes, name='cl_head')(classifier_branch)

#create the localiser branch
locator_branch = layers.Dense(128, activation='relu', name='bb_1')(base_layers)
locator_branch = layers.Dense(64, activation='relu', name='bb_2')(locator_branch)
locator_branch = layers.Dense(32, activation='relu', name='bb_3')(locator_branch)
locator_branch = layers.Dense(4, activation='sigmoid', name='bb_head')(locator_branch)

model = tf.keras.Model(input_layer, outputs=[classifier_branch,locator_branch])

losses = {"cl_head":tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True), "bb_head":tf.keras.losses.MSE}

model.compile(loss=losses, optimizer='Adam', metrics=['accuracy'])

print("Summary of the model")
model.summary()

