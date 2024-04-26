import cv2 as cv
import numpy as np
import math
img_path = "D:\projects with vs code\part code\TenQ-python-part2\moonTree.jpg"
img = cv.imread(img_path,cv.IMREAD_ANYCOLOR)
h = img.shape[0]
w = img.shape[1]
cv.imshow("image", img)
n = float(input("Enter a number?"))
w2 = math.floor(w * n)
h2 = math.floor(h * n)
img2 = np.zeros((h2,w2,3),np.uint8)
for i in range(h2-1):
    for j in range(w2-1):
        img2[i][j][2] = img[math.ceil(i/n)][math.ceil(j/n)][2]
        img2[i][j][1] = img[math.ceil(i/n)][math.ceil(j/n)][1]
        img2[i][j][0] = img[math.ceil(i/n)][math.ceil(j/n)][0]
cv.imshow("change-Image", img2)
cv.waitKey(0)