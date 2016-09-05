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
%trigger(vid);
%im=getdata(vid);
im=imread('project.jpg');
[x y k]=impixel(im);
th=0.50;
r_min=k(1)-k(1)*th;
r_max=k(1)+k(1)*th;
g_min=k(2)-k(2)*th;
g_max=k(2)+k(2)*th;
b_min=k(3)-k(3)*th;
b_max=k(3)+k(2)*th;

for l=1:100
    trigger(vid);
    im=getdata(vid);
    im1=fliplr(im)
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
    
    subplot(2,1,1);
    imshow(im);
    subplot(2,1,2);
    imshow(im1);
end

