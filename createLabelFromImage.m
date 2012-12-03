function [ labels ] = createLabelFromImage( prefix )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    grayBool = createStrokeImage(prefix);    
    
    labels = reshape(grayBool, [], 1);
end

