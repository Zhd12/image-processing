%%
% % 1. load a photo
% img = imread('./ff.jpg');
% imshow(img);
%%
% 2.Reading and changing the value of a specific pixel
% img = imread("./ff.jpg"); %for read
% img2 = imread("./ff.jpg"); %for change
% imshow(img);
% [X,Y,r] = size(img);
% s = sprintf('choose x,y between %d & %d', X,Y);
% disp(s);
% x = input('Enter a number for x?');
% y = input('Enter a number for y?');
% if x<0 || 0>X || y<0 || y<Y
%     print('This point is invalid...');
% end
% ansRed = sprintf('Red : %d', img(y,x,1));
% disp(ansRed);
% ansGreen = sprintf('Green : %d', img(y,x,2));
% disp(ansGreen);
% ansBlue = sprintf('Blue : %d', img(y,x,3));
% disp(ansBlue);
% %Changing value a pixel
% img2(y,x,1) = 255; img2(y,x,2) = 255; img2(y,x,3) = 255;
% figure; imshow(img2);

%%
% % 3.showing each layers in RGB mode
% img = imread('./Stone.jpg');
% img_red(:,:,1) = img(:,:,1);
% img_red(:,:,2) = 0;
% img_red(:,:,3) = 0;
% imshow(img_red);figure;
% img_green(:,:,2) = img(:,:,2);
% img_green(:,:,1) = 0;
% img_green(:,:,3) = 0;
% imshow(img_green);figure;
% img_blue(:,:,3) = img(:,:,3);
% img_blue(:,:,1) = 0;
% img_blue(:,:,2) = 0;
% imshow(img_blue);


%%
% % 4.addition and subtraction a fixed number by pixels
% img1 = imread('./ff.jpg');
% img2 = imread('./ff.jpg');
% [X,Y,color] = size(img1);
% disp('If you want to have dark photo enter negative number');
% num1 = input('Enter a number?');
% disp('If you want to have light photo enter positive number');
% num2 = input('Enter a number?');
% for i = 1 : Y
%     for j = 1 : X
%         R1 = img1(j,i,1); G1 = img1(j,i,2); B1 = img1(j,i,3);
%         img1(j,i,1) = R1 + num1;
%         img1(j,i,2) = G1 + num1;
%         img1(j,i,3) = B1 + num1;
%         R2 = img2(j,i,1); G2 = img2(j,i,2); B2 = img2(j,i,3);  
%         img2(j,i,1) = R2 + num2;
%         img2(j,i,2) = G2 + num2;
%         img2(j,i,3) = B2 + num2;
%     end
% end
% imshow(img1); figure; imshow(img2);




%%
% % 6.Multiply a fixed number by pixels
% img = imread('./ff.jpg');
% [X,Y,color] = size(img);
% num = input('Enter a number?');
% for i = 1 : Y
%     for j = 1 : X
%         R = img(j,i,1);
%         G = img(j,i,2);
%         B = img(j,i,3);
%         img(j,i,1) = R * num;
%         img(j,i,2) = G * num;
%         img(j,i,3) = B * num;
%     end
% end
% imshow(img);

%%
% % 7.Zoom in & zoom out on the image
% img = imread('./moonTree.jpg');
% [h,w,rgb] = size(img);
% disp('Zoom in : Enter a number (number > 0)');
% disp('Zoom out : Enter 1/number (number > 0)');
% n = input('Enter the amount of zoom?');
% h2 = floor(h * n);
% w2 = floor(w * n);
% img2 = zeros(h2,w2,3);
% for i = 1 : h2
%     for j = 1 : w2
%         img2(i,j,:) = img(ceil(i/n),ceil(j/n),:);
%     end
% end
% img2 = uint8(img2);
% imshow(img);
% figure;
% imshow(img2);

%%
% % 8.merging two images with different coefficients
% img1 = double(imread('./Stone.jpg'));
% [h1,w1,rgb1] = size(img1);
% img2 = double(imread('./Girl1.jpg'));
% [h2,w2,rgb2] = size(img2);
% img3 = zeros(h1,w1,3);
% n = input('Enter ratio that first image clearer than the second image?');
% m = 1 - n;
% for i = 1 : h1
%     for j = 1 : w1
%         r1 = img1(i,j,1);
%         g1 = img1(i,j,2);
%         b1 = img1(i,j,3);
%         r2 = img2(i,j,1);
%         g2 = img2(i,j,2);
%         b2 = img2(i,j,3);
%         img3(i,j,1) = floor((n*(r1) + m*(r2)) / 2);
%         img3(i,j,2) = floor((n*(g1) + m*(g2)) / 2);
%         img3(i,j,3) = floor((n*(b1) + m*(b2)) / 2);
%     end
% end
% img1 = uint8(img1);
% imshow(img1);
% figure;
% img2 = uint8(img2);
% imshow(img2);
% figure;
% img3 = uint8(img3);
% imshow(img3);

%%
% % 9.SOBEL
% img = imread('./Stone.jpg');
% img = rgb2gray(img);
% [h,w,c] = size(img);
% img2 = zeros(h,w);
% Gx = [-1,0,1;-2,0,2;-1,0,1];
% Gy = [-1,-2,-1;0,0,0;1,2,1];
% for i = 2 : h - 1
%     for j = 2 : w - 1
%         target = GetTarget(img,i,j);
%         G1 = ApplyMask(Gx , target);
%         G2 = ApplyMask(Gy , target);
%         G = G1 + G2;
%         img2(i,j) = G;
%     end
% end
% imshow(img);figure;
% img2 = uint8(img2);imshow(img2);
% 
% function G = ApplyMask(mask,target)
%     m = mask .* target;
%     G = sum(m,"all");
% end
% 
% function target = GetTarget(M,i,j)
%     target = zeros(3,3);
%     for x = -1 : 1
%         for y = -1 : 1
%             target(x+2,y+2) = M(i+x,j+y);
%         end
%     end
% end

%%
% % 9.edge detection...PREWITT
% img = imread('./Stone.jpg');
% img = rgb2gray(img);
% [h,w,c] = size(img);
% img2 = zeros(h,w);
% Gx = [-1,1,1;-1,-2,1;-1,1,1];
% Gy = [1,1,1;-1,-2,1;-1,-1,1];
% for i = 2 : h - 1
%     for j = 2 : w - 1
%         target = GetTarget(img,i,j);
%         G1 = ApplyMask(Gx , target);
%         G2 = ApplyMask(Gy , target);
%         G = G1 + G2;
%         img2(i,j) = G;
%     end
% end
% imshow(img);figure;
% img2 = uint8(img2);imshow(img2);
% 
% function G = ApplyMask(mask,target)
%     m = mask .* target;
%     G = sum(m,"all");
% end
% function target = GetTarget(M,i,j)
%     target = zeros(3,3);
%     for x = -1 : 1
%         for y = -1 : 1
%             target(x+2,y+2) = M(i+x,j+y);
%         end
%     end
% end


%%
% % 9.edge detection...ROBERT
% img = imread('./Stone.jpg');
% img = rgb2gray(img);
% [h,w,c] = size(img);
% img2 = zeros(h,w);
% Gx = [1,0;0,-1];
% Gy = [0,1;-1,0];
% for i = 2 : h - 1
%     for j = 2 : w - 1
%         target = GetTarget(img,i,j);
%         G1 = ApplyMask(Gx , target);
%         G2 = ApplyMask(Gy , target);
%         G = G1 + G2;
%         img2(i,j) = G;
%     end
% end
% imshow(img);figure;
% img2 = uint8(img2);imshow(img2);
% 
% function G = ApplyMask(mask,target)
%     m = mask .* target;
%     G = sum(m,"all");
% end
% function target = GetTarget(M,i,j)
%     target = zeros(2,2);
%     for x = -1 : 0
%         for y = -1 : 0
%             target(x+2,y+2) = M(i+x,j+y);
%         end
%     end
% end

%%
% % 10.apply & reduce salt-pepper noise
clear
clc
img = imread('./moonTree.jpg');
[h,w,rgb] = size(img);
perNoise = input('Enter a percent of noise?');
img = applyNoise(img,w,h,perNoise);
imshow(img);
img2 = img;
figure;
for j = 2 : w-1
    for i = 2 : h-1
        pixelRGB(1,:) = img2(i,j,:);
        if CheckZeroPixel(pixelRGB)

            mask33 = GetNeighboursAllLayer(img2,i,j);

            TruePixel = FindTruePixelAllLayer(mask33);

            img2(i,j,1) = median(TruePixel(:,1));
            img2(i,j,2) = median(TruePixel(:,2));
            img2(i,j,3) = median(TruePixel(:,3));
        end
    end
end
imshow(img2);

function image = applyNoise(image,width,height,noise)
    for i = 1 : width
        for j = 1 : height
            x = rand();
            lowerBound = noise/2/100;
            higherBound = 1 - lowerBound;
            if(x < lowerBound)
                image(j,i,:) = 0;
            elseif(x > higherBound)
                image(j,i,:) = 255;
            end
        end
    end
end

function check = CheckZeroPixel(xij)
    if(xij(1,1) == 0 && xij(1,2) == 0 && xij(1,3) == 0) ||...
            (xij(1,1) == 255 && xij(1,2) == 255 && xij(1,3) == 255)
            check = true;
    else
        check = false;
    end
end


function [frame] = GetNeighboursAllLayer(img,oi,oj)
    frame(1,:) = img(oi-1,oj-1,:);
    frame(2,:) = img(oi-1,oj,:);
    frame(3,:) = img(oi-1,oj+1,:);

    frame(4,:) = img(oi,oj-1,:);
    % frame(5) = 0;
    frame(5,:) = img(oi,oj+1,:);

    frame(6,:) = img(oi+1,oj-1,:);
    frame(7,:) = img(oi+1,oj,:);
    frame(8,:) = img(oi+1,oj+1,:);
end

function TruePixel = FindTruePixelAllLayer(vector)
    k = 1;
    m = size(vector,1);
    for i = 1 : m 
        if ~CheckZeroPixel(vector(i,:))
            TruePixel(k,:) = vector(i,:);
            k = k + 1;
        end
    end
end
