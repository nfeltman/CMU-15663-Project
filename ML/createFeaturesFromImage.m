function [ features, image_size ] = createFeaturesFromImage( file_name )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    rgb = imread(file_name);
    rgb = removeBorder(rgb);
    gray = rgb2gray(rgb);
    edges = getEdgeFeature(gray);
    [gx, gy] = getGradientFeature(gray);
	[Dxx,Dxy,Dyy] = getHessianFeatures(gray);
    frangi = getFrangiFilterFeature(gray);
    [h, s, v] = getHSVFeature(rgb);

    image_size = size(gray);
    features = [mtov(edges), mtov(gx), mtov(gy), mtov(Dxx), mtov(Dxy), mtov(Dyy), mtov(frangi), mtov(h), mtov(s), mtov(v)];


end

