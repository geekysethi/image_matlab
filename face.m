clc 
clear all
close all
im=imread('my1.jpg');
k=vision.CascadeObjectDetector;
bb=step(k,im);
figure;
imshow(im);
hold on
for i=1:size(bb,1)
end