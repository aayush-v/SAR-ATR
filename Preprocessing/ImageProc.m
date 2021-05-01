function procImg = ImageProc(imgPath)

I = imread(imgPath);
% I = im2double(I)
% whos I
% I2 = histeq(I);
% figure, imshow(I) 
% figure, imshow(I2) 

I=double(I);
a=min(min(I));
b=max(max(I));
t=120;
[m1,m2]=size(I);
I2=zeros(m1,m2);
for i=1:m1
 for j=1:m2
  I2(i,j)=(t/(b-a))*(I(i,j)-a);
 end
end
I2=uint8(I2);
% figure, imshow(I2);


meanValue = mean2(I2);
newImage = (double(I2) - meanValue);
newImage2 = uint8(newImage);
% figure, imshow(newImage)
% figure, imshow(newImage2)

median = medfilt2(newImage2);
% figure,imshow(median)

added = imadd(median, I2);
% figure, imshow(added)

Y = uint8(Lee_Filter(I2,I2,[5 5]));
% figure, imshow(Y)

addedLee = imadd(Y, added/3);
% figure, imshow(addedLee)
aL = im2double(addedLee);
% figure, imshow(aL)
% whos aL

Iblurred = imgaussfilt(aL,2);
% figure, imshow(Iblurred)

filterStrength = 50;
weights = fspecial('gaussian',[size(aL,1) size(aL,2)],filterStrength);
% figure, imshow(weights,[])

weights = rescale(weights);

IweightedBlurred = aL.*weights + Iblurred.*(1-weights);
% imwrite(IweightedBlurred, 'op/o.jpg');
procImg = IweightedBlurred;
% whos IweightedBlurred
% figure, imshow(IweightedBlurred)