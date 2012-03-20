%TIM labo 1

%init
clear
close all
fig = 1;

%params
sigma = 2;
hsize = 3*sigma;
r = 3;
%faire un tableau
%ax;


%DATA
f=imread('cameraman.tif');
%histogramme
h=mmhistogram(f);

g = fspecial('gaussian', hsize, sigma);


b=imfilter(f, g);
%f1 = imfilter(double(f), g, 'symmetric');
f1 = imfilter(f, g, 'symmetric');

B=mmsedisk(r, '2D', 'EUCLIDEAN', 'FLAT', g);


f2 = mmero(f, B);

f3 = mmdil(f, B);

f4 = mmintersec(f, f1);
%faire echo on pour voir ou il y a des problemes
%avant: f1 en double => cast

%titre (dans le plot)
title(['histogramme(f): \mu = ', num2string(mean(f2, 1))])


temp = cumsum(double(mmhistogram(f)));
LUT = uint8(255*temp/temp(end));
f6 = LUT(f+1);

figure(fig); fig = fig+1;
%ax(1) = subplot(2, 3, 1);
imshow(f)


subplot(2, 3, 2)
plot(h)

subplot(2, 3, 3)
plot(g)

%ax(2) = subplot(2, 3, 4);
plot(f1)

%ax(3) = subplot(2, 3, 5);
imshow(f2)

%ax(4) = subplot(2, 3, 6);
imshow(f3)

figure(fig); fig = fig+1;



