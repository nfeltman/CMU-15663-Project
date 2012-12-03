function [ features ] = createFileFeaturesFromDirectory( directory_root )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    drawings = dir([directory_root, '*drawing.jpg']);
    images = dir([directory_root, '*image.jpg']);
    
    numDrawings = size(images, 1);
    features = [];
    
    for i=1:numDrawings
    %for i=1:1
       disp(drawings(i).name);
       % imshow(imread([directory_root, drawings(i).name]));
       mat_name = regexprep(drawings(i).name, '_drawing.jpg', '_features.mat');
       
       paramater_name = ['p', regexprep(drawings(i).name, '_drawing.jpg', '')];
       features = createLabelFeatureCombo([directory_root, drawings(i).name], [directory_root, images(i).name]);
      % features = features);
       save([directory_root, mat_name], 'features');
       %features = [features; newFeatures];
    end
end

