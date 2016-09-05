clc
 clear all
im=imread('capture.PNG');
 s=size(im);
 temp=zeros(s(1),s(2));
 im_r=im(:,:,1);
 img_red(:,:,1)=im_r;
 img_red(:,:,2)=temp;
 img_red(:,:,3)=temp;
 im_g=im(:,:,2);
 img_green(:,:,1)=temp;
 img_green(:,:,2)=im_g;
 img_green(:,:,3)=temp;
 im_b=im(:,:,3);
 
 img_blue(:,:,1)=temp;
 img_blue(:,:,2)=temp;
 img_blue(:,:,3)=im_b;
 
 subplot(2,2,1)
 imshow(im);
 title('Original')
 subplot(2,2,2)
 imshow((img_red));
 title('Reddish')
 
 
 subplot(2,2,3)
 imshow(uint8(img_green))
 title('Greenish')
 
 subplot(2,2,4)
 imshow(uint8(img_blue));
 title('Blueish')
 
 