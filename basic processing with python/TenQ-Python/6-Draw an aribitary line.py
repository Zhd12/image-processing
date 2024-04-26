import cv2
import numpy as np
import math
width = 300
height = 300
# Make empty black image of size (300,300)
img = np.zeros((height, width, 3), np.uint8)
# get 2 points like p1(x1,y1) , p2(x2,y2)
x1 = 80 ; y1 = 100 ; x2 = 50 ; y2 = 140
# calculate the slope
m = math.floor((y2-y1)/(x2-x1))
white = [255,255,255]
if x1 > x2:
    for x in range(x2,x1):
        y = m * (x - x1) + y1
        img[x,y] = white
else:
    for x in range(x1,x2):
        y = m * (x - x1) + y1
        img[x,y] = white 

cv2.imshow('img', img)
cv2.waitKey(0)
