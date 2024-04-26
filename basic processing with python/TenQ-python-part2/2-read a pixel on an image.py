import cv2 as cv

img_path = "D:\projects with vs code\part code\TenQ-python-part2\w85.jpg"
img = cv.imread(img_path,cv.IMREAD_ANYCOLOR)

x = int(input("Enter a number of x?"))
y = int(input("Enter a number of y?"))
r = img[y,x][0]
g = img[y,x][1]
b = img[y,x][2]

print("red : ",r)
print("green :",g)
print("blue :",b)

img[y,x] = (0,0,255)
cv.imshow("w85", img)
cv.waitKey(0)

