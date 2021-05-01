I = imread('HB03335.JPG');
figure, imshow(I)
I = im2double(I);
figure, imshow(I)

Iblurred = imgaussfilt(I,2);
figure, imshow(Iblurred)

filterStrength = 50;
weights = fspecial('gaussian',[size(I,1) size(I,2)],filterStrength);
figure, imshow(weights,[])

weights = rescale(weights);

IweightedBlurred = I.*weights + Iblurred.*(1-weights);

whos IweightedBlurred
figure, imshow(IweightedBlurred)