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
new_im=zeros(s(1),s(2));

     ind=find ((im_r>r_min&im_r<=r_max)&(im_g>g_min&im_g<=g_max)&(im_b>b_min&im_b<=b_max));
            new_im(ind)=1;
       

new_im1=bwareaopen(new_im,25000);
new_im2=imfill(new_im1,'Holes');
dd=bwconncomp(new_im2);
st=regionprops(dd,'All');
subplot(211)
imshow(im);
subplot(212)
imshow(new_im2)