clc
clear all
%%Part1
x=300;
y=400;
B = imread('')%Add image here;
imshow(B)
title('Original Picture')
B=rgb2gray(B);
A=B;
C=B;
D=B;
E=B;
figure
%%Part2
U_L = A(1:x,1:y);
S = imnoise(U_L,'salt & pepper',0.03);%imnoise command used to add noise to the image
A(1:x,1:y)=S(1:x,1:y);
C(1:x,1:y)=S(1:x,1:y);%adding the noise to the upper right corner
%at this point only 1 noise is added so take the mse
mseU_L=mse(B,C);
imshow(A)
title('Salt and Pepper Noise')
figure
U_R=A(1:300,401:800);%extracting upper left data ana adding noise to it
G = imnoise(U_R,'gaussian',0,0.005);
A(1:300,401:800)=G(1:x,1:y);
D(1:300,401:800)=G(1:x,1:y);
imshow(D)
%Calculates and Shows only the noise mse
mseU_R=mse(B,D);
title('Gaussian Noise')
L_R=A(301:600,401:800);
L = imnoise(L_R,'salt & pepper',0.03);
R = imnoise(L_R,'gaussian',0,0.005);
T = L+R;
A(301:600,401:800)=T(1:x,1:y);
E(301:600,401:800)=T(1:x,1:y);
figure
%Calculates and shows only the 4th quartile noise mse 
mseL_R=mse(B,E);
imshow(E)
title('Salt and Pepper + Gaussian Noise')
%%Part4
y0 = medfilt2(C);%callin and applying mean filter
figure
imshow(y0)
a1=mse(B,y0);
title('Median Filter with Salt and Pepper Noise')
z = arith_filter(C);
figure
imshow(z)
a2=mse(B,z);
title('Arithmetic mean Filter with Salt and Pepper Noise')
j = midpoint_filter(C);
figure
imshow(j)
a3=mse(B,j);
title('Midpoint Filter with Salt and Pepper Noise')
%%Gaussian
y1 = medfilt2(D);;
figure
imshow(y1)
a4=mse(B,y1);
title('Median Filter with Gaussian Noise')
z1 = arith_filter(D);
figure
imshow(z1)
a5=mse(B,z1);
title('Arithmetic mean Filter with Gaussian Noise')
j1 = midpoint_filter(D);
figure
imshow(j1)
a6=mse(B,j1);
title('Midpoint Filter with Gaussian Noise')
%%Gaussian + Salt and Pepper
y2 = medfilt2(E);
figure
imshow(y2)
a7=mse(B,y2);
title('Median Filter with Gaussian + Salt and Pepper Noise')
z2 = arith_filter(E);
figure
imshow(z2)
a8=mse(B,z2);
title('Arithmetic mean Filter with Gaussian + Salt and Pepper Noise')
j2 = midpoint_filter(E);
figure
imshow(j2)
a9=mse(B,j2);
title('Midpoint Filter with Gaussian + Salt and Pepper Noise')
%%Part5
k=medfilt2(U_L);
m=arith_filter(U_R);
n=arith_filter(L_R);
A(1:x,1:y)=k(1:x,1:y);
A(1:300,401:800)=m(1:x,1:y);
A(301:600,401:800)=n(1:x,1:y);
figure
imshow(A)
title('All three filtered sections')
k1=arith_filter(A);
m1=medfilt2(A);
figure
imshow(k1)
title('Arithmatic Filter on all noises')
figure
imshow(m1)
title('Median Filter on all noises')



