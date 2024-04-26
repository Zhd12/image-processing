import cv2 as cv
import numpy as np
img_path = "D:\projects with vs code\part code\TenQ-python-part2\Stone1.jpg"
img = cv.imread(img_path,cv.IMREAD_ANYCOLOR)
img2 = cv.imread(img_path,cv.IMREAD_ANYCOLOR)
img3 = np.zeros((180,130,3),np.uint8)
w = img.shape[1]
h = img.shape[0]
def makeGray(img,h,w):
    for i in range(h):
        for j in range(w):
            r = img[i][j][2]
            g = img[i][j][1]
            b = img[i][j][0]
            gray = (r * 0.299) + (g * 0.587) + (b * 0.144)
            img2[i][j][0] = img2[i][j][1] = img2[i][j][2] = gray 
    return img2  
def GetTarget(data,i,j):
    target = [[0,0,0],[0,0,0],[0,0,0]]
    target[0][0] = data[i-1][j-1][2]
    target[0][1] = data[i-1][j][2]
    target[0][2] = data[i-1][j+1][2]
    target[1][0] = data[i][j-1][2]
    target[1][1] = data[i][j][2]
    target[1][2] = data[i][j+1][2]
    target[2][0] = data[i+1][j-1][2]
    target[2][1] = data[i+1][j][2]
    target[2][2] = data[i+1][j+1][2]
    return target
def ApplyMask(mask,target):
    res = multiplyOneByOne(mask, target)
    sum = 0
    for i in range(0,3):
            for j in range(0,3):
                sum += res[i][j]
    return sum
def multiplyOneByOne(a,b):
    result = []
    for i in range(len(a)):
        row_result = []
        for j in range(len(a[0])):
            row_result.append(a[i][j] * b[i][j])
        result.append(row_result)
    return result
data = makeGray(img,h,w)
Gx = [[-1,1,1],[-1,-2,1],[-1,1,1]]
Gy = [[1,1,1],[-1,-2,1],[-1,-1,1]]
for i in range(1,h-1):
    for j in range(1,w-1):
        target = GetTarget(data,i,j)
        G1 = ApplyMask(Gx,target)
        G2 = ApplyMask(Gy,target) 
        G = G1 + G2
        if G < 0:
            G = 0
        elif G > 255:
            G = 255
        img3[i][j][2] = G
        img3[i][j][1] = G
        img3[i][j][0] = G
cv.imshow('stone', img)
cv.imshow('gray stone', img2)
cv.imshow('prewitt stone', img3)
cv.waitKey(0)
