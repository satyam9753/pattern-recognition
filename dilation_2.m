clc;
clear;
clear all;
close all;

i= imread('erosion_sample.png');
%imshow(I);
[m,n] = size(i);

% m:rows  & n:columns 

w = [0 1 0; 1 1 1; 0 1 0]; %structuring elements

for x= 2:1:(m-1)
    for y = 2:1:(n-1)
        i1 = [w(1)*i(x-1,y-1) w(2)*i(x-1,y) w(3)*i(x-1,y+1)...
              w(4)*i(x,y-1) w(5)*i(x,y) w(6)*i(x,y+1)...
              w(7)*i(x+1,y-1) w(8)*i(x+1,y) w(9)*i(x+1,y+1)];
        
        I1(x,y) = max(i1);  % DILATION
    end
end

figure(1),imshow(i);
figure(2),imshow(I1);




