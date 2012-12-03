% http://www.mathworks.com/matlabcentral/newsreader/view_thread/95968
f = im2double(imread('117863_2520762195141633779_image.jpg'));
[gx, gy] = gradient(f);
figure; imshow(gx, []);
figure; imshow(gy, []);