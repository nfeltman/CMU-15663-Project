function [ averageEye ] = averageEyeCell( eyeCell )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    resizedEyeCell = resizeImageCell(eyeCell);
    
    averageEye = double(zeros(size(resizedEyeCell{1})));
    size(averageEye)
    
    for eyeCellIndex = 1:size(eyeCell,2)
       averageEye = averageEye + im2double(resizedEyeCell{eyeCellIndex});
    end
    
    averageEye = averageEye ./ size(eyeCell,2);
end

