function [imghybrid] = hybridImage(im1, im2, cutoff_low, cutoff_high)


% apply low pass filter on im1

im1_lowpass = imgaussfilt(im1, cutoff_low);
figure('Name','Fourier Transform Im1_lowpass'), hold off, imagesc(log(abs(fftshift(fft2(im1_lowpass))))), axis image

% apply high pass filter on im2

im2_highpass = im2 - imgaussfilt(im2, cutoff_high);
figure('Name','Fourier Transform Im2_highpass'), hold off, imagesc(log(abs(fftshift(fft2(im2_highpass))))), axis image


% merge two images

imghybrid = im1_lowpass + im2_highpass;
figure('Name','Fourier Transform Hybrid'), hold off, imagesc(log(abs(fftshift(fft2(imghybrid))))), axis image


%fouriertransform(im1_lowpass)
%fouriertransform(im2_highpass)
%fouriertransform(imghybrid)

end
