import cv2
import numpy as np
import math
width = 300; height = 300
# Make empty black image of size (300,300)
img = np.zeros((height, width, 3), np.uint8)
def TurnOnPixel(x,y,image):
    white = [255,255,255]
    image[x,y] = white

x = 300; y = 300; alpha = x/2; beta = y/2
r = 80
lowBoundX = int(alpha - r)
highBoundX = int(alpha + r) 
step = 0.005
X_values = np.arange(lowBoundX, highBoundX, step)
for X in X_values:
    Y1 = int(beta + math.sqrt(r*r - (X - alpha)*(X - alpha)))
    Y2 = int(beta - math.sqrt(r*r - (X - alpha)*(X - alpha)))
    TurnOnPixel(Y1, int(X), img)  # Convert X to int for column index
    TurnOnPixel(Y2, int(X), img)  # Convert X to int for column index
cv2.imshow('img', img)
cv2.waitKey(0)


