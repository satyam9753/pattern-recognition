clc;
clear;
clear all;
close all;

I= imread('img_assgn2.png');
[m,n]=size(I);

for i=1:m
    for j=1:n
        if(I(i,j)<1)    
            I(i,j)=0;
        else
            I(i,j)=255;
        end
    end
end

BW=I;

[H,T,R] = hough(BW);
imshow(H,[],'XData',T,'YData',R,...
            'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;

P  = houghpeaks(H,7,'threshold',ceil(0.7*max(H(:))));
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','white');


lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',12);
figure, imshow(I), hold on


for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   display(xy);
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','white');
end
