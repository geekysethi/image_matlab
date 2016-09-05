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
        ind=find(im_r==k(1)&im_g==k(2)&im_b==k(3));
            new_im(ind)=1;
        end
end

new_im1=bwareaopen(new_im,200);
dd=bwconncomp(new_im1);
st=regionprops(dd,'All');
for i=1:8
    sc(i)=st(i).Area;
    
end
sc1=sort(sc);

for i=1:dd.NumObjects
for j=1:dd.NumObjects
    
    if(sc1(i)==st(j).Area)
        ST(i)=st(j);
    end
end
end

figure(2);
imshow((im))
hold on

for i=1:dd.NumObjects

      
x=ST(i).Centroid(1);
y=ST(i).Centroid(2);
R=ST(i).EquivDiameter/2;
th=0:0.1:2*pi;

X=x+R*cos(th);
Y=y+R*sin(th);
if(i==8)
plot(X,Y,'c','linewidth',2);
end
text(x,y,num2str(i))
title('New Image');
pause(2);

end


