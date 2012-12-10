function [ features, image_size ] = createFeaturesFromImage( file_name )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    rgb = im2double(imread(file_name));
    rgb = removeBorder(rgb);
    image_size = [size(rgb,1) size(rgb,2)];
    
    pyramidScale = 0.25;
    pyramidLevels = 4;
    
    numFeatures = 10;
    features = zeros(prod(image_size),numFeatures*pyramidLevels);
    for level = 0:pyramidLevels-1
        rgb_scaled = imresize(rgb,pyramidScale ^ level);
         
        gray = rgb2gray(rgb_scaled);
        edges = getEdgeFeature(gray);
         [gx, gy] = getGradientFeature(gray);
         [Dxx,Dxy,Dyy] = getHessianFeatures(gray);
         frangi = getFrangiFilterFeature(gray);
         [h, s, v] = getHSVFeature(rgb_scaled);
         
         features3D = cat(3,edges,gx,gy,Dxx,Dxy,Dyy,frangi,h,s,v);
         for k = 1:numFeatures
             features(:,k+numFeatures*level) = mtov(imresize(features3D(:,:,k),image_size));
         end
    end
end
