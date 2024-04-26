import cv2
import numpy as np

width = 300
height = 300

# Make empty black image of size (300,300)
img = np.zeros((height, width, 3), np.uint8)

white = [255,255,255]

for i in range(100,200):
    for j in range(100,200):
        img[i,j] = white

cv2.imshow('img', img)
cv2.waitKey(0)



