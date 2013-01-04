function [ labels ] = createLabelFromImage( prefix )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    grayBool = createStrokeImage(prefix);    
    grayBool = conv2(grayBool,fspecial('gaussian',[4 4],1),'same')>0.24;
    labels = reshape(grayBool, [], 1);
end

