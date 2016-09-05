clc
clear all
im=imread('flower.jpg');
[rows,columns]=size(im);
c=zeros(rows/2,columns/2);
i=1;j=1;
for x=1:2:rows
    for y=1:2:columns
        c(i,j)=im(x,y);
        j=j+1;
    end
    i=i+1;
    j=1;

end
subplot(121);
imshow(im);
subplot(122);
imshow(c/255);