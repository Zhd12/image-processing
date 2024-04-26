import cv2
import numpy as np
import math

width = 300
height = 300

# Make empty black image of size (300,300)
img = np.zeros((height, width, 3), np.uint8)

# get one point like point(xp,yp)
xp = 100 ; yp = 100
# Turn on a main point
white = [255,255,255]
img[yp,xp] = white

halfY = int(height/2)
distanceY = int(halfY - yp)
newX = int(halfY + distanceY)
img[yp,newX] = white

cv2.imshow('img', img)
cv2.waitKey(0)



