import cv2
import numpy as np

width = 400
height = 400
# Make empty black image of size (400,400)
img = np.zeros((height, width, 3), np.uint8)
# get one point like 2 points (xp1,yp1) (xp2,yp2)
xp1 = 100 ; yp1 = 100
xp2 = 200 ; yp2 = 200
# Turn on a main point
white = [255,255,255]
img[yp1,xp1] = white
img[yp2,xp2] = white
deltaX = abs(xp2 - xp1)
deltaY = abs(yp2 - yp1)
newX = xp2 + deltaX
newY = yp2 + deltaY
img[newY,newX] = white

cv2.imshow('img', img)
cv2.waitKey(0)



