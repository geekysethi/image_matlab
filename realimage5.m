clc
clear all
close all
im=imread('my1.jpg');
[x y k]=impixel(im);
th=0.50;
r_min=k(1)-k(1)*th;
r_max=k(1)+k(1)*th;
g_min=k(2)-k(2)*th;
g_max=k(2)+k(2)*th;
b_min=k(3)-k(3)*th;
b_max=k(3)+k(2)*th;

im_r=im(:,:,1);
im_g=im(:,:,2);
im_b=im(:,:,3);
s=size(im);
new_im=im;

new_im=double(new_im);
for i=1:s(1)
    for j=1:s(2)
        if(((im_r(i,j)>r_min)&&(im_r(i,j)<=r_max))&&((im_g(i,j)>g_min)&&(im_g(i,j)<=g_max))&&((im_b(i,j)>b_min)&&(im_b(i,j)<=b_max)))
            new_im(i,j,1)=255;
            new_im(i,j,2)=0;
            new_im(i,j,3)=0;
        end
    end
end

  new_im1=bwareaopen(new_im,25000);
new_im2=imfill(new_im1,'Holes');

 dd=bwconncomp(new_im2);
 st=regionprops(dd,'All');
     imshow(uint8(new_im));
     
     figure(1)
     imshow(uint8(new_im1));
     
     figure(2)
     imshow(uint8(new_im2));
     
     
     
