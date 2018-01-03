close all; % closes all figures

% read images and convert to single format
im1 = im2single(imread('./clinteastwood.jpg'));
im2 = im2single(imread('./clinteastwood_monkey.jpg'));
im1 = rgb2gray(im1); % convert to grayscale
im2 = rgb2gray(im2);

figure('Name','Fourier Transform Im1'), hold off, imagesc(log(abs(fftshift(fft2(im1))))), axis image
figure('Name','Fourier Transform Im2'), hold off, imagesc(log(abs(fftshift(fft2(im2))))), axis image

% use this if you want to align the two images (e.g., by the eyes) and crop
% them to be of same size
[im2, im1] = align_images(im2, im1);

% uncomment this when debugging hybridImage so that you don't have to keep aligning
% keyboard; 

%% Choose the cutoff frequencies and compute the hybrid image (you supply
%% this code)
cutoff_low = 8;
cutoff_high = 8; 
im12 = hybridImage(im1, im2, cutoff_low, cutoff_high);

%% Crop resulting image (optional)
figure('Name','Hybrid Image'), hold off, imagesc(im12), axis image, colormap gray
disp('input crop points');
[x, y] = ginput(2);  
x = round(x); 
y = round(y);
im12 = im12(min(y):max(y), min(x):max(x), :);
figure('Name','Hybrid Image Cropped'), hold off, imagesc(im12), axis image, colormap gray

%% Compute and display Gaussian and Laplacian Pyramids (you need to supply this function)
N = 5; % number of pyramid levels (you may use more or fewer, as needed)
[pyrG, pyrL] = pyramids(im12, N);

figure('Name','Gaussian Pyramid');
subplot(1,5,1), imshow(pyrG{1})
subplot(1,5,2), imshow(pyrG{2})
subplot(1,5,3), imshow(pyrG{3})
subplot(1,5,4), imshow(pyrG{4})
subplot(1,5,5), imshow(pyrG{5})
figure('Name','Laplacian Pyramid');
subplot(1,5,1), imshow(pyrG{1})
subplot(1,5,2), imshow(pyrL{1})
subplot(1,5,3), imshow(pyrL{2})
subplot(1,5,4), imshow(pyrL{3})
subplot(1,5,5), imshow(pyrL{4})



