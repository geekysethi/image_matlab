clc
 clear all
 close all
im=imread('im11.png');
[x y k]=impixel(im);
imr=im(:,:,1);
img=im(:,:,2);
imb=im(:,:,3);
s=size(im);
new_im=zeros(s(1),s(2));
for i=1:s(1)
    for j=1:s(2)
        if(imr(i,j)==k(1)&&img(i,j)==k(2)&&imb(i,j)==k(3))
        new_im(i,j)=1;
        end
    end
end
cc=bwconncomp(new_im);
st=regionprops(cc,'All');
x=st.Centroid(1);
y=st.Centroid(2);
l=st.BoundingBox(1):0.1:st.BoundingBox(2);
b=st.BoundingBox(3):0.1:st.BoundingBox(4);

 R=st.EquivDiameter/2;
 th=0:0.1:2*pi;
 figure;
 imshow(im);
 hold on
 X=x+R*cos(th);
 Y=y+R*sin(th);
  plot(x,y,'*r','LineWidth',3)
  plot(X,Y,'y','LineWidth',3)
plot(l,b);

