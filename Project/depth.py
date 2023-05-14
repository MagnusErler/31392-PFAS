import cv2

left_im  = "Project/seq_02/image_02_left/provided/0000000000.png"
right_im = "Project/seq_02/image_03_right/provided/0000000000.png"

left  = cv2.imread(left_im ,cv2.IMREAD_COLOR)
if left is None:
    print("Cannot read image file: ", left_im)
    exit()

right = cv2.imread(right_im,cv2.IMREAD_COLOR)
if right is None:
    print("Cannot read image file: ", right_im)
    exit()

cv2.imshow("Left", left)
cv2.imshow("Right", right)
cv2.waitKey(0)
cv2.destroyAllWindows()