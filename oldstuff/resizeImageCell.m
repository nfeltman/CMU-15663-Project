function [ newCell ] = resizeImageCell( cell )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    sumSize = [0 0];
    for cellIndex = 1:size(cell,2)
       sumSize = sumSize + size(cell{cellIndex});
    end
    
    averageSize = round(sumSize ./ size(cell,2));
    
    newCell = {};
    
    for cellIndex = 1:size(cell,2)
       newCell{cellIndex} = imresize(cell{cellIndex}, averageSize);
    end
end

