import cv2 as cv
import numpy as np
import math
img_path1 = "D:\projects with vs code\part code\TenQ-python-part2\Girl1.jpg"
img_path2 = "D:\projects with vs code\part code\TenQ-python-part2\moonTree.jpg"
img1 = cv.imread(img_path1,cv.IMREAD_ANYCOLOR)
img2 = cv.imread(img_path2,cv.IMREAD_ANYCOLOR)
h = img1.shape[0]
w = img1.shape[1]
cv.imshow("girl image", img1)
cv.imshow("stone image", img2)
n = float(input("Enter a number?"))
m = 1 - n
img3 = np.zeros((h,w,3),np.uint8)
for i in range(h-1):
    for j in range(w-1):
        r1 = img1[i][j][2]
        g1 = img1[i][j][1]
        b1 = img1[i][j][0]
        r2 = img2[i][j][2]
        g2 = img2[i][j][1]
        b2 = img2[i][j][0]
        img3[i][j][2] = math.floor((n*r1 + m*r2)/2)
        img3[i][j][1] = math.floor((n*g1 + m*g2)/2)
        img3[i][j][0] = math.floor((n*b1 + m*b2)/2)
cv.imshow("Merge Image", img3)
cv.waitKey(0)