imaqreset
clc
close all
clear all
vid=videoinput('winvideo',1,'YUY2_640x480');
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
im=cat(3,im1,im2,im3); %fliped image


[x1 y1 k1]=impixel(im);
[x2 y2 k2]=impixel(im);
[x3 y3 k3]=impixel(im);

th=0.80;
r_min1=k1(1)-k1(1)*th;
r_max1=k1(1)+k1(1)*th;
g_min1=k1(2)-k1(2)*th;
g_max1=k1(2)+k1(2)*th;
b_min1=k1(3)-k1(3)*th;
b_max1=k1(3)+k1(3)*th;

r_min2=k2(1)-k2(1)*th;
r_max2=k2(1)+k2(1)*th;
g_min2=k2(2)-k2(2)*th;
g_max2=k2(2)+k2(2)*th;
b_min2=k2(3)-k2(3)*th;
b_max2=k2(3)+k2(2)*th;

r_min3=k3(1)-k3(1)*th;
r_max3=k3(1)+k3(1)*th;
g_min3=k3(2)-k3(2)*th;
g_max3=k3(2)+k3(2)*th;
b_min3=k3(3)-k3(3)*th;
b_max3=k3(3)+k3(2)*th;


im_r=im(:,:,1);
im_g=im(:,:,2);
im_b=im(:,:,3);
s=size(im);
new_im1=zeros(s(1),s(2));
new_im2=zeros(s(1),s(2));
new_im3=zeros(s(1),s(2));

for l=1:50
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
 
for i=1:s(1)
    for j=1:s(2)
        
        if(im_r(i,j)>r_min1&&im_r(i,j)<=r_max1&&im_g(i,j)>g_min1&&im_g(i,j)<=g_max1&&im_b(i,j)>b_min1&&im_b(i,j)<=b_max1)
            new_im1(i,j)=1;
        end
        
        if(im_r(i,j)>r_min2&&im_r(i,j)<=r_max2&&im_g(i,j)>g_min2&&im_g(i,j)<=g_max2&&im_b(i,j)>b_min2&&im_b(i,j)<=b_max2)
            new_im2(i,j)=1;
        end
        
        if(im_r(i,j)>r_min3&&im_r(i,j)<=r_max3&&im_g(i,j)>g_min3&&im_g(i,j)<=g_max3&&im_b(i,j)>b_min3&&im_b(i,j)<=b_max3)
            new_im3(i,j)=1;
        end
        
    end
        
end
th=0:pi/100:2*pi;

new_im11=bwareaopen(new_im1,2500);
new_im21=imfill(new_im11,'Holes');
aa=bwconncomp(new_im21);

new_im12=bwareaopen(new_im2,2500);
new_im22=imfill(new_im12,'Holes');
bb=bwconncomp(new_im22);

 new_im13=bwareaopen(new_im3,2500);
new_im23=imfill(new_im13,'Holes');
cc=bwconncomp(new_im23);
    
     %calculating total number of objects
     m1=aa.NumObjects;
     m2=bb.NumObjects;
     m3=cc.NumObjects;
     m=m1+m2+m3;
    imshow(im);
 hold on
  
if(m>2)

    %//  Calling regionprops  //

%Sorting first regionprops if objects is more than one 
st1=regionprops(aa,'All');    

l1=length(st1);
if(l1>1)

for z1=1:l1
    sc1(z1)=st1(z1).Area;
    
end
sc1=sort(sc1);

for g1=1:aa.NumObjects
for h1=1:aa.NumObjects
    
    if(sc1(g1)==st1(h1).Area)
        ST1(g1)=st1(h1);
    end 
end
end
     x4=ST1(aa.NumObjects).Centroid(1);
     y4=ST1(aa.NumObjects).Centroid(2);
     R4=ST1(aa.NumObjects).EquivDiameter/2;

else
     x4=st1.Centroid(1);
     y4=st1.Centroid(2);
     R4=st1.EquivDiameter/2;

end

%Sorting Second regionprops if objects is more than one 
st2=regionprops(bb,'All');    

l2=length(st2);
if(l2>1)

for z2=1:l2
    sc2(z2)=st2(z2).Area;
    
end
sc2=sort(sc2);

for g2=1:bb.NumObjects
for h2=1:bb.NumObjects
    
    if(sc2(g2)==st2(h2).Area)
        ST2(g2)=st2(h2);
    end 
end
end
     x5=ST2(bb.NumObjects).Centroid(1);
     y5=ST2(bb.NumObjects).Centroid(2);
     R5=ST2(bb.NumObjects).EquivDiameter/2;

else
     x5=st2.Centroid(1);
     y5=st2.Centroid(2);
     R5=st2.EquivDiameter/2;


end



%Sorting Third regionprops if objects is more than one 
        st3=regionprops(cc,'All');    
        l3=length(st3);
        if(l3>1)
        for z3=1:l3
            sc3(z3)=st3(z3).Area;
        end
            sc3=sort(sc3);
        for g3=1:cc.NumObjects
        for h3=1:cc.NumObjects
            
            if(sc3(g3)==st3(h3).Area)
                ST3(g3)=st3(h3);
                
            end 
        end
        end
        
      x6=ST3(cc.NumObjects).Centroid(1);
     y6=ST3(cc.NumObjects).Centroid(2);
     R6=ST3(cc.NumObjects).EquivDiameter/2;

else
     x6=st3.Centroid(1);
     y6=st3.Centroid(2);
     R6=st3.EquivDiameter/2;

        end

%////////////////////////////////////////////


%calculating centriods and dia.
%1
     X4=x4+R4*cos(th);
     Y4=y4+R4*sin(th);
%2
     X5=x5+R5*cos(th);
     Y5=y5+R5*sin(th);
%3    
      X6=x6+R6*cos(th);
      Y6=y6+R6*sin(th);

 
 %distance
 d1=sqrt((x4^2-x5^2)+(y4^2-y5^2));
 d2=sqrt((x4^2-x6^2)+(y4^2-y6^2));
 d3=sqrt((x6^2-x5^2)+(y6^2-y5^2));
 
 %ploting
     plot(x4,y4,'*m','LineWidth',3.5);
     plot(X4,Y4,'y','lineWidth',2.5);
     plot(x5,y5,'*m','LineWidth',3.5);
     plot(X5,Y5,'y','lineWidth',2.5);
     plot(x6,y6,'*m','LineWidth',3.5);
     plot(X6,Y6,'y','lineWidth',2.5);
%calculating line
     x7=[x4,x5];
     y7=[y4,y5];
     plot(x7,y7,'k');
     text(x7,y7,num2str(d1),'HorizontalAlignment','center');

     x8=[x4,x6];
     y8=[y4,y6];
     plot(x8,y8,'k');
     text(x8,y8,num2str(d2),'HorizontalAlignment','center');

     x9=[x6,x5];
     y9=[y6,y5];
     plot(x9,y9,'k');
     text(x9,y9,num2str(d3),'HorizontalAlignment','center');
     hold off
end
m=1;
end
stop(vid);
delete(vid);
clear('vid');
imaqreset;






