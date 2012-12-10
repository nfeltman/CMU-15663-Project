function [ X, Y ] = blurAndHomogenize( M, sigma, nu )

X = M(:,:,1);
Y = M(:,:,2);
W = M(:,:,3);

kernel = fspecial('gaussian',ceil(2.5*sigma)*2+1,sigma);
X = conv2(X,kernel,'same');
Y = conv2(Y,kernel,'same');
W = conv2(W,kernel,'same') + nu;

X = X./W;
Y = Y./W;

end

