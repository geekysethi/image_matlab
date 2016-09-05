imaqreset
clc
close all
clear all
vid=videoinput('winvideo');
set(vid,'ReturnedColorSpace','rgb');
set(vid,'FramesPerTrigger',1);
set(vid,'TriggerRepeat',inf);
triggerconfig(vid,'manual'); 
start(vid);
pause(2);
trigger(vid);
im=getdata(vid);
im1=im(:,:,1);
im1=fliplr(im1);

im2=im(:,:,2);
im2=fliplr(im2);

im3=im(:,:,3);
im3=fliplr(im3);
im=cat(3,im1,im2,im3);


[x y k]=impixel(im);
th=0.30;
r_min=k(1)-k(1)*th;
r_max=k(1)+k(1)*th;
g_min=k(2)-k(2)*th;
g_max=k(2)+k(2)*th;
b_min=k(3)-k(3)*th;
b_max=k(3)+k(2)*th;
count=1;
for i=1:200
    trigger(vid);
    
 im=getdata(vid);
 im1=im(:,:,1);
im1=fliplr(im1);

im2=im(:,:,2);
im2=fliplr(im2);

im3=im(:,:,3);
im3=fliplr(im3);
im=cat(3,im1,im2,im3);

 im_r=im(:,:,1);
im_g=im(:,:,2);
im_b=im(:,:,3);
s=size(im);
new_im=zeros(s(1),s(2));
for l=1:s(1)
    for j=1:s(2)
        if(((im_r(l,j)>r_min)&&(im_r(l,j)<=r_max))&&((im_g(l,j)>g_min)&&(im_g(l,j)<=g_max))&&((im_b(l,j)>b_min)&&(im_b(l,j)<=b_max)))
            new_im(l,j)=1;
           
        end
        
    end
end
    
  new_im1=bwareaopen(new_im,25000);
   dd=bwconncomp(new_im1);
   
   m=dd.NumObjects;
   if(m>=1)
st=regionprops(dd,'All');
if(l>1)
l=length(st);
for z=1:l
    sc(z)=st(z).Area;
    
end
sc1=sort(sc);

for g=1:dd.NumObjects
for h=1:dd.NumObjects
    
    if(sc1(g)==st(h).Area)
        ST(g)=st(h);
    end 
end
end
 
x=ST(dd.NumObjects).Centroid(1);
y=ST(dd.NumObjects).Centroid(2);
R=ST(dd.NumObjects).EquivDiameter/2;
else
    
x=st.Centroid(1);
y=st.Centroid(2);
R=st.EquivDiameter/2;
end
trace1(count)=x;
trace2(count)=y;
count=count+1;

th=0:pi/100:2*pi;
X=x+R*cos(th);
Y=y+R*sin(th);
imshow(im);
hold on
plot(x,y,'*m','LineWidth',3.5);
plot(X,Y,'y','lineWidth',2.5)
plot(trace1,trace2,'k','LineWidth',1.5);

   end
m=1;
end
stop(vid);
delete(vid);
clear(vid);
imaqreset;
