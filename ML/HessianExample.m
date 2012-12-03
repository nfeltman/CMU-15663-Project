%RGB = imread('117863_2520762195141633779_image.jpg');
RGB = imread('1103941_2520703493728906168_image.jpg');
I = rgb2gray(RGB);
Id = double(I);
[Dxx,Dxy,Dyy] = Hessian2D(I,2);
figure, imshow(Dxx,[]);
figure, imshow(Dxy, []);
figure, imshow(Dyy, []);
Ivessel=FrangiFilter2D(Id);
figure
subplot(1,2,2), imshow(Ivessel,[0 0.25]);