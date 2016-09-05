clc
clear all
close all
im=imread('my1.jpg');
n1=fix(size(im,1)/2);
n2=fix(size(im,2)/2);
a1=im(1:n1,:,:);
b1=im(1+n1:end,:,:);
a2=im(:,1:n2,:);
b2=im(:,n2+1:end,:);

a3=im(1:n1,1:n2,:);
b3=im(1+n1:end,1:n2,:);

a4=im(1:n1,n2+1:end,:);

b4=im(1+n1:end,n2+1:end,:);
figure(1);
subplot(211)
imshow(a1);
subplot(212)
imshow(b1);

figure(2);
subplot(121)
imshow(a2);
subplot(122)
imshow(b2);

figure(3);
subplot(221)
imshow(a3);
subplot(223)
imshow(b3);
subplot(222)
imshow(a4);
subplot(224)
imshow(b4)

