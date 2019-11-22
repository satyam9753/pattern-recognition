clc;
clear all;
close all;

I= imread('erosion_sample.png');
[x,y,p]=size(I);  %get size of image
J=zeros(x,y);     

%giving all the pixels of the image binary values (alternative to 'im2bw')
for i=1:1:x
    for j=1:1:y
        if(I(i,j)>128)
            J(i,j)=1;
        else
            J(i,j)=0;
        end
    end
end

L=J        
J= ~J;  %for dilation add this line

a=[0 1 0; 1 1 1 ; 0 1 0];
[m,n,p]=size(J);
F=zeros(m,n);
b=a;
for i=2:1:m-1
    for j=2:1:n-1
         for k=1:1:3
             for l=1:1:3
                 b(k,l)=a(k,l)*J(i+k-2,j+l-2); 
             end
         end
         if(b==a)
             F(i,j)=1;
         end
    end     
end
boundary = (~F) - L;
figure(1),imshow(I);
figure(2),imshow(~F);           % dilation of the image 
figure(3),imshow(boundary);     % boundary of the image
%imshow(F);
%imshow(F); for erosion