%%
% % make a canvas
% image = zeros(100,200);
% imshow(image);

%%
% % Turn on a pixel
% img = zeros(100,100);
% img(50,50) = 255;
% imshow(img);

%%
% % Draw a horizontal & vertical line
% img = zeros(400,400);
% img(50:150,200) = 255;
% img(200,50:150) = 255;
% imshow(img);
% figure;
% % another way
% img1 = zeros(400,400);
% img1 = uint8(img1);
% for i = 50 : 150
%     img1(i,200,1) = 255;
%     img1(i,200,2) = 0;
%     img1(i,200,3) = 0;
%     img1(200,i,1) = 255;
%     img1(200,i,2) = 0;
%     img1(200,i,3) = 0;
% end
% imshow(img1)

%%
% % Draw a hollow square
% img = zeros(500,500);
% img(200:400,100) = 255;
% img(200:400,300) = 255;
% img(200,100:300) = 255;
% img(400,100:300) = 255;
% imshow(img);

%%
% % Draw a solid square
% img = zeros(500,500);
% for i = 200 : 400
%     for j = 100 : 300
%         img(i,j) = 255;
%     end
% end
% imshow(img);

%%
% % Draw an arbitrary line with the line formula
% img = zeros(500,500);
% img = uint8(img);
% x1 = input('enter a number for X1?');
% y1 = input('enter a number for Y1?');
% x2 = input('enter a number for X2?');
% y2 = input('enter a number for Y2?');
% m = (y2-y1)/(x2-x1);
% step = 0.05;
% if x2 > x1
%     step = -0.05;
% end
% for x = x2 : step : x1
%     y = m * (x - x1) + y1;
%     Y = round(y); X = round(x);
%     img(X,Y) = 255;
% end
% img(x1,y1) = 255;
% img(x2,y2) = 255;
% img = uint8(img);
% imshow(img);


%%
% % Drawing full circle
% x = 200; y = 200;
% circleFrame = zeros(x,y);
% beta = y/2; alpha = x/2;
% R = input('Enter radius of circle?');
% circleFrame(alpha,beta) = 255;
% step = 0.005;
% for r = 1 : R
%     lowBoundX = alpha - r;
%     highBoundX = alpha + r;
%     for X = lowBoundX : step : highBoundX
%         Y1 = beta + sqrt(r^2 - (X - alpha)^2);
%         Y1 = round(Y1);
%         Y2 = beta - sqrt(r^2 - (X - alpha)^2);
%         Y2 = round(Y2);
%         X = round(X);
%         circleFrame(Y1,X) = 255;
%         circleFrame(Y2,X) = 255;
%     end
% end
% imshow(circleFrame);

%%    
% %symmetry to vertical line
% img = zeros(500,500);
% [X,Y] = size(img);
% xp = input('enter x of pointl?');
% yp = input('enter y of pointl?');
% img(xp,yp) = 255; halfY = Y/2;
% distanceY = halfY - yp;
% newY = halfY + distanceY;
% img(xp,newY) = 255;
% img = uint8(img);
% imshow(img); 



%%
% %symmetry to horizontal line
% img = zeros(500,500);
% [X,Y] = size(img);
% xp = input('enter x of point 1?');
% yp = input('enter y of point 2?');
% img(yp,xp) = 255;
% halfX = X /2;
% distanceX = halfX - xp;
% newX = halfX + distanceX;
% img(newX,yp) = 255;
% img = uint8(img);
% imshow(img);

%%
% %symmetry to coordinate 
% img = zeros(500,500);
% xpl = input('enter x of pointl?');
% ypl = input('enter y of pointl?');
% xp2 = input('enter x of point2?');
% yp2 = input('enter y of point2?');
% img(xpl,ypl) = 255;
% img(xp2,yp2) = 255;
% deltaX = abs(xp2 - xpl);
% deltaY = abs(yp2 - ypl);
% newX = xp2 + deltaX;
% newY = yp2 + deltaY;
% img(newX,newY) = 255;
% img = uint8(img);
% imshow(img); 

%%
% % make a gradient image
% % black to white
% frame = zeros(256,256);
% frame = uint8(frame);
% [x,y] = size(frame);
% for i = 1 : x
%     for j = 1 : y
%         frame(i,j,1) = j;
%         frame(i,j,2) = j;
%         frame(i,j,3) = j;
%     end
% end
% imshow(frame);

%%
% % make a gradient image
% % white to blue
% frame = zeros(256,256);
% frame = uint8(frame);
% [x,y] = size(frame);
% for i = 1 : x
%     c = 255;
%     for j = 1 : y
%         frame(i,j,1) = c;
%         frame(i,j,2) = c;
%         frame(i,j,3) = 255;
%         if c>= 0
%             c= c - 1;
%         end
%     end
% end
% imshow(frame);

%%
% % make a gradient image
% % green to red
% frame = zeros(256,256);
% frame = uint8(frame);
% [x,y] = size(frame);
% for i = 1 : x
%     c = 255;
%     for j = 1 : y
%         frame(i,j,1) = j;
%         frame(i,j,2) = c;
%         frame(i,j,3) = 0;
%         if c>= 0
%             c= c - 1;
%         end
%     end
% end
% imshow(frame);


%%
% making a chessboard
frame = zeros(300,300);
xStart = 50; yStart = 50; width = 200; wRect = round(width/8);
frame = DrawRect(frame ,xStart,yStart,width);
for i = 0 : 7
    for j = 0 : 7
        xRect = xStart + wRect*i;
        yRect = yStart + wRect*j;  
        color = 255;
        if (-1)^(i+j) == -1
            color = 0;
        end 
        frame = FillRect(frame,xRect,yRect,wRect,color);
    end
end
imshow(frame);
function fr = DrawRect(fr,x,y,w)
    fr(x:x+w,y) = 255;
    fr(x:x+w,y+w) = 255;
    fr(x,y:y+w) = 255;
    fr(x+w,y:y+w) = 255;
end
function fra = FillRect(fra,x,y,w,c)
    for i = x+1 : x+w-1
        for j = y+1 : y+w-1
            fra(i,j) = c; 
        end
    end
end






