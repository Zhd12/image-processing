import cv2
import numpy as np

width = 300
height = 300

# Make empty black image of size (300,300)
img = np.zeros((height, width, 3), np.uint8)

cv2.imshow('image', img)
cv2.waitKey(0)

