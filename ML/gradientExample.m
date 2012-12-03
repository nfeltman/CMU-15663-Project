% http://www.mathworks.com/matlabcentral/newsreader/view_thread/95968
f = im2double(imread('1103941_2520703493728906168_image.jpg'));
[gx, gy] = gradient(f);
figure; imshow(gx, []);
figure; imshow(gy, []);