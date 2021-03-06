clc 
clear all
close all
im =imread('im10.png');
[x ,y ,k]=impixel(im);
im_r=im(:,:,1);
im_g=im(:,:,2);
im_b=im(:,:,3);
s=size(im);
new_im=zeros(s(1),s(2));
for i=1:s(1)
    for j=1:s(2)
        if(im_r(i,j)==k(1)&&im_g(i,j)==k(2)&&im_b(i,j)==k(3))
            new_im(i,j)=1;
        end
    end
end


new_im1=bwareaopen(new_im,200);
dd=bwconncomp(new_im1);
st=regionprops(dd,'All');


figure(2);
imshow((im))
hold on

for i=1:dd.NumObjects

      
x=st(i).Centroid(1);
y=st(i).Centroid(2);
R=st(i).EquivDiameter/2;
th=0:0.1:2*pi;

X=x+R*cos(th);
Y=y+R*sin(th);
plot(X,Y,'c','linewidth',2);
text(x,y,num2str(i))
title('New Image');

end