function [ features ] = createFeaturesFromDirectory( directory_root )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    images = dir([directory_root, '*drawing.jpg']);
    drawings = dir([directory_root, '*image.jpg']);
    
    numDrawings = size(images, 1);
    features = [];
    
    for i=1:numDrawings
    %for i=1:1
       disp(drawings(i).name);
       % imshow(imread([directory_root, drawings(i).name]));
       newFeatures = createLabelFeatureCombo([directory_root, drawings(i).name], [directory_root, images(i).name]);
       features = [features; newFeatures];
    end
end

