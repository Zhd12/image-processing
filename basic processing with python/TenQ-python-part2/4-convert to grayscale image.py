import cv2 as cv
img_path = "D:\projects with vs code\part code\TenQ-python-part2\moonTree.jpg"
img = cv.imread(img_path,cv.IMREAD_ANYCOLOR)
imgToGray = cv.imread(img_path,cv.IMREAD_ANYCOLOR)
width = img.shape[1]
height = img.shape[0]

cv.imshow("image", img)

for i in range(height):
    for j in range(width):
        r = img[i][j][2]
        g = img[i][j][1]
        b = img[i][j][0]
        gray = (r*0.299)+(g*0.587)+(b*0.144)
        imgToGray[i][j][2] = imgToGray[i][j][1] = imgToGray[i][j][0] = gray

cv.imshow("grayImage", imgToGray)

cv.waitKey(0)
