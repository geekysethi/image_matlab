clc 
clear all
close all
im =imread('im13.png');
im=imresize(im,.5);
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
st=regionprops(new_im,'All');
x=fix(st.Centroid(1));
y=fix(st.Centroid(2));


if((x<=615)&&(y<=185))
fprintf('2nd Quadrant\n');


elseif(610<x&&x<=1171&&185<y&&y<=187)
fprintf('1st Quadrant\n');


elseif( x<=586&&187<y&&y<=556)
fprintf('3rd Quadrant\n');


else
fprintf('4th Quadrant\n');
end
close all
