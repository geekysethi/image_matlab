clc
clear all
close all
im=imread('virtual.jpg');
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
for i=1:s(1)
    for j=1:s(2)
        if(((im_r(i,j)>r_min)&&(im_r(i,j)<=r_max))&&((im_g(i,j)>g_min)&&(im_g(i,j)<=g_max))&&((im_b(i,j)>b_min)&&(im_b(i,j)<=b_max)))
            new_im(i,j)=1;
        end
    end
end

new_im1=bwareaopen(new_im,10000);
new_im2=imfill(new_im1,'Holes');
dd=bwconncomp(new_im2);
st=regionprops(dd,'All');




      
 x=st.Centroid(1);
 y=st.Centroid(2);
 R=st.EquivDiameter/2;
 th=0:0.1:2*pi;
 
 X=x+R*cos(th);
 Y=y+R*sin(th);
 subplot(231)
 imshow(im);
 subplot(232)
 imshow(new_im);
 subplot(233)
 imshow(new_im1);
 subplot(234)
 imshow(new_im2);
 subplot(235)
 hold on
 imshow(im)
   plot(x,y,'*r','LineWidth',3)
   plot(X,Y,'y','LineWidth',3)
 








