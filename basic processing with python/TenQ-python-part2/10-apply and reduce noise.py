import cv2 as cv
import numpy as np
import random as rnd
import math

img_path = r"D:\projects with vs code\part code\TenQ-python-part2\moonTree.jpg"
img = cv.imread(img_path, cv.IMREAD_ANYCOLOR)
img2 = cv.imread(img_path, cv.IMREAD_ANYCOLOR)

w = img.shape[1]
h = img.shape[0]

img3 = cv.imread(img_path, cv.IMREAD_ANYCOLOR)
num = float(input("Enter a percent of noise to apply: "))

def ApplyNoise(img2, w, h, perNoise):
    for i in range(h):
        for j in range(w):

            x = rnd.random()

            lowerBound = perNoise / 2 / 100
            higherBound = 1 - lowerBound

            if x < lowerBound:
                img2[i][j] = [0, 0, 0]

            elif x > higherBound:
                img2[i][j] = [255, 255, 255]
    return img2


def CheckZeroPixel(xij):
    if (xij[0] == 0 and xij[1] == 0 and xij[2] == 0) or (xij[0] == 255 and xij[1] == 255 and xij[2] == 255):
        return True
    else:
        return False
def GetNeighbours(data, i, j, c):

    target = []

    if c == 2:
        target.append(data[i-1][j-1][2])
        target.append(data[i-1][j][2])
        target.append(data[i-1][j+1][2])
        target.append(data[i][j-1][2])
        target.append(data[i][j+1][2])
        target.append(data[i+1][j-1][2])
        target.append(data[i+1][j][2])
        target.append(data[i+1][j+1][2])

    elif c == 1:
        target.append(data[i-1][j-1][1])
        target.append(data[i-1][j][1])
        target.append(data[i-1][j+1][1])
        target.append(data[i][j-1][1])
        target.append(data[i][j+1][1])
        target.append(data[i+1][j-1][1])
        target.append(data[i+1][j][1])
        target.append(data[i+1][j+1][1])

    elif c == 0:
        target.append(data[i-1][j-1][0])
        target.append(data[i-1][j][0])
        target.append(data[i-1][j+1][0])
        target.append(data[i][j-1][0])
        target.append(data[i][j+1][0])
        target.append(data[i+1][j-1][0])
        target.append(data[i+1][j][0])
        target.append(data[i+1][j+1][0])
    return target

def FindTruePixels(vector):
    truePixel = [x for x in vector if x != 0 and x != 255]
    return truePixel
noiseImage = ApplyNoise(img2, w, h, num)
for i in range(1, h - 1):
    for j in range(1, w - 1):
        vector = noiseImage[i][j]

        if CheckZeroPixel(vector):
            red_neighbour = GetNeighbours(noiseImage, i, j, 2)    # red 
            green_neighbour = GetNeighbours(noiseImage, i, j, 1)  # green
            blue_neighbour = GetNeighbours(noiseImage, i, j, 0)   # blue

            truePixel_red = FindTruePixels(red_neighbour)
            truePixel_green = FindTruePixels(green_neighbour)
            truePixel_blue = FindTruePixels(blue_neighbour)

            if len(truePixel_red) == 0 or len(truePixel_green) == 0 or len(truePixel_blue) == 0:
                newValue_r = 0; newValue_g = 0; newValue_b = 0
         
            elif len(truePixel_red) == 1 or len(truePixel_green) == 1 or len(truePixel_blue) == 1:
                newValue_r = truePixel_red[0]; newValue_g = truePixel_green[0]; newValue_b = truePixel_blue[0]
            else:
                newValue_r = math.floor(np.median(truePixel_red))
                newValue_g = math.floor(np.median(truePixel_green))
                newValue_b = math.floor(np.median(truePixel_blue))

            img3[i][j] = [newValue_b, newValue_g, newValue_r] 

cv.imshow("main image", img)
cv.imshow("apply noise", noiseImage)
cv.imshow("reduce noise", img3)
cv.waitKey(0)
