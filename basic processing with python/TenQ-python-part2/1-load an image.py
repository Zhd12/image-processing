import cv2 as cv

img = cv.imread("D:\projects with vs code\part code\TenQ-python-part2\w85.jpg",cv.IMREAD_ANYCOLOR)
cv.imshow("w85", img)
cv.waitKey(0)