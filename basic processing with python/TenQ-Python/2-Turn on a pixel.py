import cv2
import numpy as np

# TURN ON A PIXEL

width = 300
height = 300

# Make empty black image of size (300,300)
img = np.zeros((height, width, 3), np.uint8)

white = [0,0,255]

# Change pixel (150,150) to white
img[150,150] = white

cv2.imshow('img', img)
cv2.waitKey(0)

