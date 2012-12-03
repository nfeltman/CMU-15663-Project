% http://www.mathworks.com/products/image/demos.html?file=/products/demos/shipping/images/ipexcell.html
RGB = imread('117863_2520762195141633779_image.jpg');
I = rgb2gray(RGB);
[junk threshold] = edge(I, 'sobel');
fudgeFactor = .5;
BWs = edge(I,'sobel', threshold * fudgeFactor);
figure, imshow(BWs), title('binary gradient mask');