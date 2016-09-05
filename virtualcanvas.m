imaqreset
clc
close all
clear all
count=0;
vid=videoinput('winvideo');
set(vid,'ReturnedColorSpace','rgb');
set(vid,'FramesPerTrigger',1);
set(vid,'TriggerRepeat',inf);
triggerconfig(vid,'manual'); 
start(vid);
pause(2);
trigger(vid);
im=getdata(vid);

[x y k]=impixel(im);
th=0.50;
r_min=k(1)-k(1)*th;
r_max=k(1)+k(1)*th;
g_min=k(2)-k(2)*th;
g_max=k(2)+k(2)*th;
b_min=k(3)-k(3)*th;
b_max=k(3)+k(2)*th;

for i=1:100
    trigger(vid);
    im=getdata(vid);
    
   im_r=im(:,:,1);
im_g=im(:,:,2);
im_b=im(:,:,3);
s=size(im);
new_im=zeros(s(1),s(2));
for l=1:s(1)
    for j=1:s(2)
         ind=find ((im_r>r_min&im_r<=r_max)&(im_g>g_min&im_g<=g_max)&(im_b>b_min&im_b<=b_max));
            new_im(ind)=1;
            count=count+1;
       
    end
end
new_im1=bwareaopen(new_im,25000);
new_im2=imfill(new_im1,'Holes');
dd=bwconncomp(new_im2)
if(count>10000)
st=regionprops(dd,'All')
x=st.Centroid(1);
y=st.Centroid(2);
trace1(i)=x;
trace2(i)=y;
R=st.EquivDiameter/2;
th=0:0.1:2*pi;

X=x+R*cos(th);
Y=y+R*sin(th);

imshow(im);
hold on
plot(x,y,'*c' );
plot(X,Y,'y');
plot(trace1,trace2);
end
end

