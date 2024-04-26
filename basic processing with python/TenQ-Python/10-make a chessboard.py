import cv2
import numpy as np

width = 300
height = 300
xStart = 50
yStart = 50
c = 0
w = 200
wRect = round(w/8)

# Make empty black image of size (300,300)
img = np.zeros((height, width,3), np.uint8)

def drawFillRect(x,y,w,image,c):
    color = [c,c,c]
    xEnd = x + w
    yEnd = y + w
    for i in range(x+1,xEnd):
        for j in range(y+1,yEnd):
            image[i,j] = color

def drawRect(xStart,img,w):
    white = [255,255,255]
    xEnd = xStart + w
    for i in range(xStart,xEnd):
        #draw vertical line
        img[i,xStart] = white
        img[i,xEnd] = white
        #draw horizontal line
        img[xStart,i] = white
        img[xEnd,i] = white

drawRect(xStart,img,w)
for i in range(0,8):
    for j in range(0,8):
        xRect = xStart + wRect*i
        yRect = yStart + wRect*j 
        color = 255
        if (-1)**(i+j) == -1:
            color = 0
        drawFillRect(xRect,yRect,wRect,img,color)

cv2.imshow('img', img)
cv2.waitKey(0)



