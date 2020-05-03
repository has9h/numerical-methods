a = imread('sample_1.jpg');
size(a)

image(a) % displays the data in array C as an image. Each element of C specifies the color for 1 pixel of the image.
% The resulting image is an m-by-n grid of pixels where m is the number of columns and n is the number of rows in C.
% The row and column indices of the elements determine the centers of the corresponding pixels

hold on
b = rgb2gray(a);
hold off

image(b)
imshow(b)

c
d

image(d)

c = b(:, 50:100);

imshow(c)
c = b(:, 50:500);
imshow(c)