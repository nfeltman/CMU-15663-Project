function [ labels ] = createLabelFromImage( file_name )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    file_name
    RGB = imread(file_name);
    RGB_small = removeBorder(RGB);
    
    gray = rgb2gray(RGB_small);
    grayBool = gray < 240;
    labels = reshape(grayBool, [], 1);
end

