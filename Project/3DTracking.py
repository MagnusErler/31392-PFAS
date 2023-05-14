
import cv2
import glob
import re
import os
import numpy as np
import matplotlib.pyplot as plt
from getPixelValue import getPixelValue

# IMPORTING DATA
def importLabels():
    print("Importing labels...")
    label_path = "seq_02/labels.txt"
    labels = np.loadtxt(label_path, delimiter=' ', dtype=str, usecols=range(15)) #15

    #Frame, ID, Class, BB{4} tror jeg
    frame = labels[:,0].astype(int)
    track_id = labels[:,1].astype(int)
    type = labels[:,2]
    #truncated = labels[:,3].astype(float)
    #occluded = labels[:,4].astype(int)
    #alpha = labels[:,5].astype(float)

    bbox = labels[:,6:10].astype(float)
    #bbox = labels[:,3:7].astype(float)


    #dimensions = labels[:,10:13].astype(float)


    #location_x = np.loadtxt(label_path, usecols=13)
    #location_y = np.loadtxt(label_path, usecols=14)
    #location_z = np.loadtxt(label_path, usecols=15)

    #rotation_y = labels[:,16]
    #score = labels[:,17]



    # combine location_x, location_y and location_z to one array
    #location = np.array([location_x, location_y, location_z])



    return frame, track_id, type, bbox#, dimensions, location#, rotation_y, score

def importImages(path):
    print("Importing images...")

    i = 0
    grays = []

    images = glob.glob(path + '/*.png')
    #assert images
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


    height = 390
    width = 1225

    # multiple all values in bbox with

    # for j in range(len(bbox)):
    #     bbox[j][0] = bbox[j][0] * width
    #     bbox[j][1] = bbox[j][1] * height
    #     bbox[j][2] = bbox[j][0]
    #     bbox[j][3] = bbox[j][1]

    for i in range(len(images)):
        for j in range(len(frame)):
            if frame[j] == i:
                cv2.rectangle(images[i], (int(bbox[j][0]), int(bbox[j][1])), (int(bbox[j][2]), int(bbox[j][3])), (255, 0, 0), 2)
                cv2.putText(images[i], str(type[j] + ": " + str(track_id[j])), (int(bbox[j][0]), int(bbox[j][1])), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 0, 0), 2)
                cv2.imshow("Image", images[i])
                cv2.waitKey(10)
                
def drawBoxOnImageAndSaveVideo(images_L, output_video):
    print("Saving video...")

    # get height and width of the image
    height = 390
    width = 1225 

    frame_size = (width, height)


    # initialize the video writer object
    fourcc = cv2.VideoWriter_fourcc(*"mp4v")
    video_writer = cv2.VideoWriter(output_video, fourcc, 30, frame_size)


    for i in range(len(images_L)):
        for j in range(len(frame)):
            if frame[j] == i:

                bgr_image = cv2.cvtColor(images_L[i], cv2.COLOR_GRAY2BGR)

                cv2.rectangle(bgr_image, (int(bbox[j][0]), int(bbox[j][1])), (int(bbox[j][2]), int(bbox[j][3])), (255, 0, 0), 2)
                cv2.putText(bgr_image, str(type[j] + ": " + str(track_id[j])), (int(bbox[j][0]), int(bbox[j][1])), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 0, 0), 2)

                video_writer.write(bgr_image)

    # release the video writer object and show a message
    video_writer.release()
    print("Video saved successfully!")

def drawSpecificBoxOnImage(images, specific_track_id):

    for i in range(len(images)):
        for j in range(len(frame)):
            if frame[j] == i and track_id[j] == specific_track_id:
                cv2.rectangle(images[i], (int(bbox[j][0]), int(bbox[j][1])), (int(bbox[j][2]), int(bbox[j][3])), (255, 0, 0), 2)
                cv2.putText(images[i], str(type[j]), (int(bbox[j][0]), int(bbox[j][1])), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 0, 0), 2)
                cv2.imshow("Image", images[i])
                cv2.waitKey(100)

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

def getMiddleOfSpecificBoundingBox(images, specific_track_id):
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

def getMiddleOfSpecificBoundingBox_LARS(images, specific_track_id):
    # getting the coordinates of the middle of the bounding box, label it and return coordinates and label

    # set x_coordinates and y_coordinates to list with -1 to avoid index out of range error and the same lenght as images
    x_coordinates = [-1] * len(images)
    y_coordinates = [-1] * len(images)
    labels = [-1] * len(images)

    a = 0







    height = 390
    width = 1225

    # multiple all values in bbox with

    for j in range(len(bbox)):
        bbox[j][0] = bbox[j][0] * width
        bbox[j][1] = bbox[j][1] * height




    for i in range(len(images)):
        for j in range(len(frame)):
            if frame[j] == i and track_id[j] == int(specific_track_id):
                x_coordinates[a] = bbox[j][0]
                y_coordinates[a] = bbox[j][1]
                labels[a] = type[j]

                a = a + 1

    # combining the x and y coordinates
    coordinates = np.array([x_coordinates, y_coordinates])

    # flipping the y coordinates
    #coordinates[1] = 375 - coordinates[1]

    # Round the coordinates to whole numbers and convert to integers
    coordinates = np.round(coordinates).astype(int)

    return coordinates, labels

def drawDotOnImage(images, coordinates):
    # Draw a dot on the middle of the bounding box
    for i in range(len(images)):
        cv2.circle(images[i], (int(coordinates[i]), 195), 5, (0, 0, 255), -1)
        cv2.imshow("Image", images[i])
        cv2.waitKey(100)

def plotCoordinates(coordinates, labels, height, width):
    # Get the x- and y-coordinates from the list of coordinates. X is the first element in each coordinate pair and Y is the second element.
    x_coords = coordinates[0]
    y_coords = coordinates[1]
    # define y_coords as the same length as x_coords with only ones in it
    #y_coords = np.ones(len(x_coords))

    #1.13 -> 18.86
    #multipe with 16.67 to get the right scale
    y_coords = y_coords * 16.67

    #y_coords = y_coords / 1000

    # Define the colors for each label
    colors = {'Car': 'red', 'Pedestrian': 'yellow', 'Cyclist': 'purple'}
    #colors = {1: 'red', 2: 'yellow', 3: 'purple'}


    # Create a scatter plot with different colors for each label
    for label in set(labels):
        print("label: ", label)
        if label == -1:
            continue

        
        x = [x_coords[i] for i in range(len(x_coords)) if labels[i] == label]
        y = [y_coords[i] for i in range(len(y_coords)) if labels[i] == label]
        plt.scatter(x, y, c=colors[label], label=label)

    # Set the plot title and legend
    plt.title('Object Tracking')
    plt.legend()
    #plt.xlim(0, width)
    #plt.ylim(0, 10)

    # Show the plot
    plt.show()

def getDistanceFromCamera(X_L, X_R):

    f = 981.2178
    B = 0.54

    Z = f * B / (X_L - X_R)

    return Z

def getCoordinatesInRightImageFromLeftImage(imgL, imgR):

    window_size = 5 
    left_matcher = cv2.StereoSGBM_create(
        minDisparity=-10,
        numDisparities=4*16,  # max_disp has to be dividable by 16 f. E. HH 192, 256
        blockSize=window_size,
        P1=9 * 3 * window_size,
        P2=128 * 3 * window_size,
        disp12MaxDiff=12,
        uniquenessRatio=40,
        speckleWindowSize=50,
        speckleRange=32,
        preFilterCap=63,
        mode=cv2.STEREO_SGBM_MODE_SGBM_3WAY
    )

    right_matcher = cv2.ximgproc.createRightMatcher(left_matcher)
    dispr = right_matcher.compute(imgR, imgL)
    dispr = np.int16(dispr)

    return dispr

if __name__ == '__main__':

    frame, track_id, type, bbox = importLabels()

    images_L = importImages("seq_02/image_02_left/provided")
    images_R = importImages("seq_02/image_03_right/provided")
    images_depth = importImages("seq_02/depth")
    
    #Resizing left image
    #for i in range(len(images_L)):
    #    images_L[i] = cv2.resize(images_L[i], (1225, 390), interpolation=cv2.INTER_AREA)
    #    images_R[i] = cv2.resize(images_R[i], (1225, 390), interpolation=cv2.INTER_AREA)

    for i in range(len(images_depth)):
        images_depth[i] = cv2.resize(images_depth[i], (1225, 390), interpolation=cv2.INTER_AREA)

    #coordinates, labels  = getMiddleOfSpecificBoundingBox(images_L, track_id,trackObject)
    #coordinates, labels  = getMiddleOfSpecificBoundingBox(images_R, track_id,trackObject)
    #coordinates, labels  = getMiddleOfBoundingBox(images_L)
    #coordinates, labels  = getMiddleOfBoundingBox(images_R)

    # trackObject = 22

    # # get the coordinates of the middle of the bounding box when track_id =trackObject in the right image
    # coordinates_L, labels  = getMiddleOfSpecificBoundingBox(images_L, trackObject)
    # #coordinates_L, labels  = getMiddleOfSpecificBoundingBox_LARS(images_L, trackObject)

    # coordinates_R = getCoordinatesInRightImageFromLeftImage(images_L[0], images_R[0])



    # # print("coordinates_L: ", coordinates_L)
    # # print("coordinates_R: ", coordinates_R)

    
    
    # #coordinates_L, labels  = getMiddleOfSpecificBoundingBox(images_L, trackObject)

    # coordinates_L_x = coordinates_L[0]
    # coordinates_L_y = coordinates_L[1]
    # coordinates_R_x = coordinates_R[0]
    # coordinates_R_y = coordinates_R[1]

    # X = []
    # Z = []
    # for i in range(len(coordinates_L[0])):
    #     Z.append(getDistanceFromCamera(coordinates_L_x[i], coordinates_R_x[i]))
    #     X.append(coordinates_L_x[i])


    #print("X: ", X)
    #print("Z: ", Z)

    #drawBoxOnImageAndSaveVideo(images_L, "output_video.mp4")

    #drawBoxOnImage(images_L)
    #drawSpecificBoxOnImage(images_L, trackObject)





    #drawBoxOnImage(images_L)
    #drawBoxOnImage(images_R)

    #depthValueFileName = []
    #for fname in images_depth:
    #    depthValueFileName.append(fname)

    # print("lenght of images_depth: " + str(len(images_depth)))
    # print("lenght of coordinates[0]: " + str(len(coordinates[0])))
    # print("lenght of coordinates[1]: " + str(len(coordinates[1])))
    # print("lenght of images_L: " + str(len(images_L)))

    

    # coordinates_x = coordinates[0].astype(int)
    # coordinates_y = coordinates[1].astype(int)

    # print("coordinates_x: " + str(coordinates_x))
    # print("coordinates_y: " + str(coordinates_y))

    # depthValue = []
    # for i in range(len(images_depth)):
    #     # get gray value from depth image and append to depthValue list
    #     depthValue.append(images_depth[i][coordinates_y[i], coordinates_x[i]])

    # print("depthValue: " + str(depthValue))



    # track every object in the images and show them on a plot
    for i in range(len(images_L)):
        # get the coordinates of the middle of the bounding box when track_id =trackObject in the right image
        coordinates_L, labels  = getMiddleOfBoundingBox(images_L[i])
        coordinates_R, labels  = getCoordinatesInRightImageFromLeftImage(images_L[i], images_R[i])

        coordinates_L_x = coordinates_L[0]
        coordinates_L_y = coordinates_L[1]
        coordinates_R_x = coordinates_R[0]
        coordinates_R_y = coordinates_R[1]

        X = []
        Z = []
        for i in range(len(coordinates_L[0])):
            Z.append(getDistanceFromCamera(coordinates_L_x[i], coordinates_R_x[i]))
            X.append(coordinates_L_x[i])

        print("X: ", X)
        print("Z: ", Z)

        plt.scatter(X, Z)
        plt.pause(1)
        plt.clf()


    exit()
    

    # #drawSpecificBoxOnImage(images_L, track_id, trackObject)

    # #print("coordinates_x: " + str(coordinates_x))
    # #print("depthValue: " + str(depthValue))

    # print("size of coordinates_x: " + str(len(coordinates_x)))
    # print("size of depthValue: " + str(len(depthValue)))
    

    #coordinates = np.array([coordinates_x, depthValue])
    #print("Coordinates: " + str(coordinates))


    #plotCoordinates(coordinates, labels)


    # X = []
    # Z = []

    # # get location[0] and location[2] from label = trackObject
    # for i in range(len(coordinates_x)):
    #     if track_id[i] == trackObject:
    #         print("i: " + str(i))
    #         X.append(coordinates_x[i])
    #         Z.append(depthValue[i])

    print("size of X: " + str(len(X)))
    print("size of Z: " + str(len(Z)))

    # make Z only ones
    #X = np.ones(len(X))

    # flip Z values around 255/2
    #for i in range(len(Z)):
    #   Z[i] = 255 - Z[i]


    coordinates = np.array([X, Z])

    plotCoordinates(coordinates, labels, images_L[0].shape[0], images_L[0].shape[1])







