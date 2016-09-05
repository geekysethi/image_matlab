clc 
clear all
close all
im =imread('im5.png');
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

imshow(new_im);