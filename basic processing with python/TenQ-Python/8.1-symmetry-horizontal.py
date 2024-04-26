import cv2
import numpy as np

width = 300
height = 300

# Make empty black image of size (300,300)
img = np.zeros((height, width, 3), np.uint8)

# get one point like point(xp,yp)
xp = 100 ; yp = 100
# Turn on a main point
white = [255,255,255]
img[yp,xp] = white

halfX = int(width/2)
distanceX = int(halfX - xp)
newY = int(halfX + distanceX)
img[newY,xp] = white

cv2.imshow('img', img)
cv2.waitKey(0)