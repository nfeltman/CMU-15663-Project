function [ returnImage ] = resizeImage( image )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [rows, cols] = size(image);
    returnImage = image(2:rows -1, 2:cols-1, :);
end

