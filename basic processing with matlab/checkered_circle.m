% checkered circle
clc;clear;close all;
sizeZeros = 400;
img = zeros(sizeZeros,sizeZeros,'uint8');
center = [round(sizeZeros/2),round(sizeZeros/2)];
r = [20,40,60,80,100,120,140,160];
for x = center(1)-(r(end)+1) : center(1)+(r(end)+1)
    for y = center(2)-(r(end)+1) : center(2)+(r(end)+1)
        sum = (x-center(1))*(x-center(1)) + (y - center(2))*(y - center(2));
        d = round(sqrt(sum));
       if d == r(end) + 1
            img(y,x,1) = 255;
            img(y,x,2) = 0;
            img(y,x,3) = 0;
       end
    end
end
c2 = 0; 
eachAngle = 30;
numberOfCircle = size(r);
for Angle = 0 : eachAngle : 360-eachAngle
    if mod(c2,2) == 0
        c1 = 0;
        for numR = numberOfCircle(2) :-1: 1
            if mod(c1,2) == 0
                img = circleSector(img,center,r(numR),r(numR-1),-Angle,-(Angle+eachAngle),1);
            else
                if numR - 1 == 0
                    break;
                end
                img = circleSector(img,center,r(numR),r(numR-1),-Angle,-(Angle+eachAngle),0);
            end
            imshow(img);
            c1 = c1 + 1;
        end
    elseif mod(c2,2) ~= 0
        c1 = 0;
        for numR = numberOfCircle(2) :-1: 1
            if mod(c1,2) == 0
                img = circleSector(img,center,r(numR),r(numR-1),-Angle,-(Angle+eachAngle),0);
            else
                if numR - 1 == 0
                    break;
                end
                img = circleSector(img,center,r(numR),r(numR-1),-Angle,-(Angle+eachAngle),1);
            end
            imshow(img);
            c1 = c1 + 1;
        end
    end
    c2 = c2 + 1;
end

function img = circleSector(img,center,r2,r1,start_angle,end_angle,color)
    if color == 1
        % img(center(2),center(1)) = 255;
        for rad = r2 : -1 : r1
            if start_angle > end_angle
                temp = start_angle;
                start_angle = end_angle;
                end_angle = temp;
            end
            for teta = start_angle :0.1: end_angle
                 y = round(rad*sind(teta) + center(2));
                 x = round(rad*cosd(teta) + center(1));
                 if x == 0
                    x = 1;
                 end
                 if y == 0 
                    y = 1;
                 end
                img(y,x,1) = 255;
                img(y,x,2) = 255;
                img(y,x,3) = 255;
            end
        end
    elseif color == 0
        % img(center(2),center(1)) = 0;
        for rad = r2 : -1 : r1
            if start_angle > end_angle
                temp = start_angle;
                start_angle = end_angle;
                end_angle = temp;
            end
            for teta = start_angle :0.1: end_angle
                 y = round(rad*sind(teta) + center(2));
                 x = round(rad*cosd(teta) + center(1));
                 if x == 0
                    x = 1;
                 end
                 if y == 0 
                    y = 1;
                 end
                img(y,x,1) = 0;
                img(y,x,2) = 0;
                img(y,x,3) = 0;
            end
        end
    end
end

