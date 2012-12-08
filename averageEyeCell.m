function [ averageEye ] = averageEyeCell( eyeCell )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    sumSize = [0 0];
    for eyeCellIndex = 1:size(eyeCell,2)
       sumSize = sumSize + size(eyeCell{eyeCellIndex});
    end
    
    averageSize = round(sumSize ./ size(eyeCell,2))
    
    averageEye = double(zeros(averageSize));
    
    for eyeCellIndex = 1:size(eyeCell,2)
       averageEye = averageEye + im2double(imresize(eyeCell{eyeCellIndex}, averageSize));
    end
    
    averageEye = averageEye ./ size(eyeCell,2);
end

