x=videoinput('winvideo',1)
for i=1:5
    img=getsnapshot(x);
    fname=['Image' num2str(i)];
    imwrite(img,fname,'jpg');
    pause(1)
end