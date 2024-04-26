import cv2
import numpy as np

width = 256
height = 256

# Make empty black image of size (256,256)
img = np.zeros((height, width,3), np.uint8)

for i in range(width):
    k = 255
    for j in range(height):
        img[i,j] = [255,k,k]
        k = k - 1

cv2.imshow('img', img)
cv2.waitKey(0)



