vid=videoinput('winvideo');
set(vid,'ReturnedColorSpace','rgb');
set(vid,'FramesPerTrigger',1);
set(vid,'TriggerRepeat',inf);
triggerconfig(vid,'manual'); 
start(vid);
pause(2);
for i=1:100
    trigger(vid);
    im=getdata(vid);
    im_g=rgb2gray(im);
    subplot(2,1,1);
    imshow(im);
    subplot(2,1,2);
    imshow(im_g);
end
stop(vid);
delete(vid);
clear(vid);
    