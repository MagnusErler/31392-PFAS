
import cv2
import glob
import re
import os
import numpy as np
import matplotlib.pyplot as plt
from getPixelValue import getPixelValue
from mpl_toolkits.mplot3d import Axes3D

# IMPORTING DATA
def importLabels():
    print("Importing labels...")
    label_path = "seq_02/labels.txt"
    labels = np.loadtxt(label_path, delimiter=' ', dtype=str, usecols=range(15))

    frame = labels[:,0].astype(int)
    track_id = labels[:,1].astype(int)
    type = labels[:,2]
    truncated = labels[:,3].astype(float)
    occluded = labels[:,4].astype(int)
    alpha = labels[:,5].astype(float)
    bbox = labels[:,6:10].astype(float)
    dimensions = labels[:,10:13].astype(float)


    location_x = np.loadtxt(label_path, usecols=13)
    location_y = np.loadtxt(label_path, usecols=14)
    location_z = np.loadtxt(label_path, usecols=15)

    #rotation_y = labels[:,16]
    #score = labels[:,17]

    # combine location_x, location_y and location_z to one array
    location = np.array([location_x, location_y, location_z])



    return frame, track_id, type, truncated, occluded, alpha, bbox, dimensions, location#, rotation_y, score

def importImages(path):
    print("Importing images...")

    i = 0
    grays = []

    images = glob.glob(path + '/*.png')
    assert images
    image_paths_sorted = sorted(images, key=lambda i: int(os.path.splitext(os.path.basename(i))[0]))

    for image in image_paths_sorted:

        picture_number = int(re.sub('\D', '', str(image_paths_sorted[i])))
        i+=1
        
        img = cv2.imread(image)
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

        #Write picture number on image
        cv2.putText(gray, str(picture_number), (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)

        grays.append(gray)

    return grays

# SHOWING RESULTS
def drawBoxOnImage(images):
    for i in range(len(images)):
        for j in range(len(frame)):
            if frame[j] == i:
                cv2.rectangle(images[i], (int(bbox[j][0]), int(bbox[j][1])), (int(bbox[j][2]), int(bbox[j][3])), (255, 0, 0), 2)
                cv2.putText(images[i], str(type[j]), (int(bbox[j][0]), int(bbox[j][1])), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 0, 0), 2)
                cv2.imshow("Image", images[i])
                cv2.waitKey(10)

def drawSpecificBoxOnImage(images, track_id, specific_track_id):

    for i in range(len(images)):
        for j in range(len(frame)):
            if frame[j] == i and track_id[j] == specific_track_id:
                cv2.rectangle(images[i], (int(bbox[j][0]), int(bbox[j][1])), (int(bbox[j][2]), int(bbox[j][3])), (255, 0, 0), 2)
                cv2.putText(images[i], str(type[j]), (int(bbox[j][0]), int(bbox[j][1])), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 0, 0), 2)
                cv2.imshow("Image", images[i])
                cv2.waitKey(1000)

def getMiddleOfBoundingBox(images):
    # getting the coordinates of the middle of the bounding box, label it and return coordinates and label

    x_coordinates = []
    y_coordinates = []
    labels = []
    for i in range(len(images)):
        for j in range(len(frame)):
            if frame[j] == i:
                x_coordinates.append((bbox[j][0] + bbox[j][2]) / 2)
                y_coordinates.append((bbox[j][1] + bbox[j][3]) / 2)
                labels.append(type[j])

    # combining the x and y coordinates
    coordinates = np.array([x_coordinates, y_coordinates])

    # flipping the y coordinates
    coordinates[1] = 375 - coordinates[1]

    # Round the coordinates to integers
    coordinates = np.round(coordinates) 

    return coordinates, labels

def getMiddleOfSpecificBoundingBox(images, track_id, specific_track_id):
    # getting the coordinates of the middle of the bounding box, label it and return coordinates and label

    # set x_coordinates and y_coordinates to list with -1 to avoid index out of range error and the same lenght as images
    x_coordinates = [-1] * len(images)
    y_coordinates = [-1] * len(images)
    labels = [-1] * len(images)

    a = 0

    for i in range(len(images)):
        for j in range(len(frame)):
            if frame[j] == i and track_id[j] == int(specific_track_id):
                x_coordinates[a] = ((bbox[j][0] + bbox[j][2]) / 2)
                y_coordinates[a] = ((bbox[j][1] + bbox[j][3]) / 2)
                labels[a] = type[j]

                a = a + 1

    # combining the x and y coordinates
    coordinates = np.array([x_coordinates, y_coordinates])

    # flipping the y coordinates
    coordinates[1] = 375 - coordinates[1]

    # Round the coordinates to whole numbers and convert to integers
    coordinates = np.round(coordinates).astype(int)

    return coordinates, labels

def drawDotOnImage(images, coordinates):
    # Draw a dot on the middle of the bounding box
    for i in range(len(images)):
        cv2.circle(images[i], (int(coordinates[i]), 195), 5, (0, 0, 255), -1)
        cv2.imshow("Image", images[i])
        cv2.waitKey(10)

def plotCoordinates(coordinates, labels):
    # Get the x- and y-coordinates from the list of coordinates. X is the first element in each coordinate pair and Y is the second element.
    x_coords = coordinates[0]
    y_coords = coordinates[1]
    # define y_coords as the same length as x_coords with only ones in it
    #y_coords = np.ones(len(x_coords))

    # Define the colors for each label
    colors = {'Car': 'red', 'Pedestrian': 'yellow', 'Cyclist': 'purple'}


    # Create a scatter plot with different colors for each label
    for label in set(labels):
        if label == -1:
            continue

        
        x = [x_coords[i] for i in range(len(x_coords)) if labels[i] == label]
        y = [y_coords[i] for i in range(len(y_coords)) if labels[i] == label]
        plt.scatter(x, y, c=colors[label], label=label)

    # Set the plot title and legend
    plt.title('Object Tracking')
    plt.legend()

    # Show the plot
    plt.show()

if __name__ == '__main__':

    frame, track_id, type, truncated, occluded, alpha, bbox, dimensions, location = importLabels()


            

    images_L = importImages("seq_02/image_02_left/provided")
    #images_L = importImages("seq_02/depth")
    #images_R = importImages("seq_02/image_03_right/provided")
    #images_depth = glob.glob("seq_02/depth/*.png")
    depthValue = []

    images_depth = glob.glob("seq_02/depth/*.png")
    assert images_depth
    images_depth = sorted(images_depth, key=lambda i: int(os.path.splitext(os.path.basename(i))[0]))
    

    #Resizing image
    for i in range(len(images_L)):
        images_L[i] = cv2.resize(images_L[i], (1225, 390), interpolation=cv2.INTER_AREA)

    for i in range(len(images_depth)):
        images_depth[i] = cv2.resize(images_depth[i], (1225, 390), interpolation=cv2.INTER_AREA)
        #images_R[i] = cv2.resize(images_R[i], (1290, 390), interpolation=cv2.INTER_AREA)

    coordinates, labels  = getMiddleOfSpecificBoundingBox(images_L, track_id, 22)

    depthValueFileName = []
    for fname in images_depth:
        depthValueFileName.append(fname)

    print("lenght of depthValueFileName: " + str(len(depthValueFileName)))
    print("lenght of coordinates[0]: " + str(len(coordinates[0])))
    print("lenght of coordinates[1]: " + str(len(coordinates[1])))
    print("lenght of images_L: " + str(len(images_L)))
    
    for i in range(len(images_L)):
        depthValue.append(getPixelValue(depthValueFileName[i], coordinates[0,i], coordinates[1,i]))
    

    #drawSpecificBoxOnImage(images_L, track_id, 22)

    X = coordinates[0]
    Z = depthValue

    

    coordinates = np.array([X, Z])
    #print("Coordinates: " + str(coordinates))


    #plotCoordinates(coordinates, labels)


    # get first and second element in location
    

    #print("X: " + str(X))
    #print("Y: " + str(Y))

    # X = []
    # Z = []

    # # get location[0] and location[2] from label = 22
    # for i in range(len(track_id)):
    #     if track_id[i] == 22:
    #         X.append(location[0,i])
    #         Z.append(location[2,i])

    # make Z only ones
    #X = np.ones(len(X))

    print(Z)

    coordinates = np.array([X, Z])



    plotCoordinates(coordinates, labels)







