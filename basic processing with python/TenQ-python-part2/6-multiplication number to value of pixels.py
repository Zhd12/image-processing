import cv2 as cv
img_path = "D:\projects with vs code\part code\TenQ-python-part2\moonTree.jpg"
img = cv.imread(img_path,cv.IMREAD_ANYCOLOR)
img2 = cv.imread(img_path,cv.IMREAD_ANYCOLOR)
width = img.shape[0]
height = img.shape[1]
def RecTrueColor(c,number):
    newColor = c * number
    if newColor > 255:
        newColor = 255
    elif newColor < 0:
        newColor = 0
    return newColor
cv.imshow("image", img)
num = float(input("Enter a number?"))
for i in range(width):
    for j in range(height):
        r = img[i][j][2]
        g = img[i][j][1]
        b = img[i][j][0]
        img2[i][j][2] = RecTrueColor(r,num)
        img2[i][j][1] = RecTrueColor(g,num)
        img2[i][j][0] = RecTrueColor(b,num)
cv.imshow("change-Image", img2)
cv.waitKey(0)
