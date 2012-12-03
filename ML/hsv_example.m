RGB = imread('1103941_2520703493728906168_image.jpg');
hsv_image = rgb2hsv(RGB);
figure;
imshow(hsv_image(:,:,1));
figure;
imshow(hsv_image(:,:,2));
figure;
imshow(hsv_image(:,:,3));
