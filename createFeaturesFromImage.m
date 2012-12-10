function [ features, image_size ] = createFeaturesFromImage( prefix )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    largeImage = im2double(imread(drawAFriendFileName(prefix, 'P')));
    rgb = aspectRatio(largeImage, 320, 460);
%    rgb = removeBorder(rgb);
    image_size = [size(rgb,1) size(rgb,2)];
    
    pyramidScale = 0.25;
    pyramidLevels = 4;
    
    numFeatures = 9;
    features = zeros(prod(image_size),numFeatures*pyramidLevels);
    for level = 0:pyramidLevels-1
        rgb_scaled = imresize(rgb,pyramidScale ^ level);
         
        gray = rgb2gray(rgb_scaled);
        gray = normalize(gray);
        edges = getEdgeFeature(gray);
         [gx, gy] = getGradientFeature(gray);
         [Dxx,Dxy,Dyy] = getHessianFeatures(gray);
         frangi = getFrangiFilterFeature(gray);
         [h, s, v] = getHSVFeature(rgb_scaled);
         
         features3D = cat(3,edges,gx,gy,Dxx,Dxy,Dyy,frangi,h,gray);
         for k = 1:numFeatures
             features(:,k+numFeatures*level) = mtov(imresize(features3D(:,:,k),image_size));
         end
    end
end

function im = normalize(im)
    im = im - mean(im(1:end));
    im = im / std(im(1:end));
end
