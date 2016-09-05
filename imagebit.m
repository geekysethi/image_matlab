clc
 clear all
 im =imread('seeds.jpg');
c=double(im);
k=mod(c,2);
k1=mod(floor(c/2),2);
k2=mod(floor(c/4),2);
k3=mod(floor(c/8),2);
k4=mod(floor(c/16),2);
k5=mod(floor(c/64),2);
k6=mod(floor(c/128),2);
subplot(241);
imshow(im);
subplot(242);
imshow(k);
subplot(243);
imshow(k1);
subplot(244);
imshow(k2);
subplot(245);
imshow(k3);
subplot(246);
imshow(k4);
subplot(247);
imshow(k5);
subplot(248);
imshow(k6);



 