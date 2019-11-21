clc;
clear;
clear all;
close all;



I= imread('For_asign1.jpg');
%imhist(I);
%imshow(I);
threshold =76;
threshold2 = 132;
[m,n]=size(I);
Ithres= zeros(m,n);

for i=1:m
    for j=1:n
        if((I(i,j)>threshold)&&(I(i,j)<threshold2))
            Ithres(i,j)=255;
            
        else
            Ithres(i,j)=0;
        end
    end
end

subplot(1,2,1);
imshow(I);
title('Original Image');

subplot(1,2,2);
imshow(Ithres);
title('Threshold Image');

%fprintf('%d',n);