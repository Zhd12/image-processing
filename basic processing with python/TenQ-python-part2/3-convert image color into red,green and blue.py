import cv2 as cv
img_path = "D:\projects with vs code\part code\TenQ-python-part2\moonTree.jpg"
img_red = cv.imread(img_path,cv.IMREAD_ANYCOLOR)
img_green = cv.imread(img_path,cv.IMREAD_ANYCOLOR)
img_blue = cv.imread(img_path,cv.IMREAD_ANYCOLOR)
width = img_red.shape[1]
height = img_red.shape[0]
# red image
for i in range(height):
    for j in range(width):
        img_red[i][j][2] = 255
# green image
for i in range(height):
    for j in range(width):
        img_green[i][j][1] = 255
# blue image
for i in range(height):
    for j in range(width):
        img_blue[i][j][0] = 255
cv.imshow("imgRed", img_red)
cv.imshow("imgGreen", img_green)
cv.imshow("imgBlue", img_blue)
cv.waitKey(0)
