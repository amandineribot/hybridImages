function [pyrG, pyrL] = pyramids (image, N)

%computes a Gaussian pyramid reduction using fct impyramid

[pyrG] = cell(1:N);
[pyrL] = cell(1:N-1);
pyrG{1} = image;

%the function impyramid (gaussian pyramid) use sigma at 0.375, 
%the same value was used to the laplacian pyramid, using the function
%imfilter and fspecial

for i=2:N   
    pyrG{i} = impyramid(pyrG{i-1}, 'reduce');
    pyrL{i-1} = imfilter(pyrG{i-1}, fspecial('log', [5 5], 0.375));
end

end
