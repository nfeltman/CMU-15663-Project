function [ allFeatures ] = createArrayFromFiles( directory, files, percentage )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    startLocation = [1, 1];
    
    newSizes = getMatrixFiles(directory, files);
    allFeatures = zeros(newSizes);
    
    for file_index = 1:size(files, 1)
        load([directory, files(file_index).name]);
        featureSize = size(features);
        
        allFeatures(startLocation(1): startLocation(1) + featureSize(1) - 1, :) = features;
        startLocation(1) = startLocation(1) + featureSize(1);
    end
end

function [ totalSize ] = getMatrixFiles( directory, files )
    totalSize = [0, 0];
    
    [directory, files(1).name]
    for file_index = 1:size(files, 1)
       load([directory, files(file_index).name]);
       ySize = size(features, 2);
       totalSize = size(features) + totalSize
    end
    
    totalSize(1,2) = ySize;
end