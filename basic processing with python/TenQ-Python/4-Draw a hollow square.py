import cv2
import numpy as np

width = 300
height = 300

# Make empty black image of size (300,300)
img = np.zeros((height, width, 3), np.uint8)

white = [255,255,255]

for i in range(50,150):
    #draw vertical line
    img[i,50] = white
    img[i,150] = white
    #draw horizontal line
    img[50,i] = white
    img[150,i] = white

cv2.imshow('img', img)
cv2.waitKey(0)
