

import cv2

old_frame = None


cap = cv2.VideoCapture('Robots.mp4')

if cap.isOpened() == False:
    print('Error opening video file')

while cap.isOpened():
    ret, frame = cap.read()

    if ret == False:
        print('Error reading video file')
        break

    if cv2.waitKey(25) & 0xFF == ord('q'):
        break

    #cv2.imshow('Frame', frame)
    #cv2.waitKey(20)

    # Tracking the robot with subtracting the first frame from the current frame and then thresholding the result to get a binary image with the robot in white and the background in black

    if old_frame is None:
        old_frame = frame
        continue
    frameDelta = cv2.absdiff(old_frame, frame)

    old_frame = frame


    # converting to grayscale
    frameDelta = cv2.cvtColor(frameDelta, cv2.COLOR_BGR2GRAY)

    # Remove noise from the image by applying a Gaussian blur with a 5x5 kernel and then thresholding the image
    frameDelta = cv2.GaussianBlur(frameDelta, (5, 5), 0)


    # convert all black pixels to white and all white pixels to black
    #frameDelta = cv2.bitwise_not(frameDelta)

    # Blur the image to remove noise
    frameDelta = cv2.GaussianBlur(frameDelta, (5, 5), 0)

    frameDelta = cv2.dilate(frameDelta, None, iterations = 30)

    #frameDelta = cv2.Canny(frameDelta, 30, 150)
    


    # Converting all white pixels to red pixels
    frameDelta = cv2.cvtColor(frameDelta, cv2.COLOR_GRAY2BGR)
    frameDelta[:, :, 0] = 0
    frameDelta[:, :, 1] = 0


    # Thresholding the image to get a binary image
    ret, frameDelta = cv2.threshold(frameDelta, 10, 255, cv2.THRESH_BINARY)

    # Remove all single pixel noise from the image
    frameDelta = cv2.erode(frameDelta, None, iterations = 60)

    frameDelta = cv2.dilate(frameDelta, None, iterations = 30)

    frameDelta = cv2.erode(frameDelta, None, iterations = 50)

    frameDelta = cv2.dilate(frameDelta, None, iterations = 50)

    frameDelta = cv2.erode(frameDelta, None, iterations = 60)

    frameDelta = cv2.dilate(frameDelta, None, iterations = 30)





    # Add frameDelta to the original frame
    frame = cv2.add(frame, frameDelta)
    #frame = frameDelta



    


    cv2.imshow('Frame', frame)


cap.release()

cv2.destroyAllWindows()

