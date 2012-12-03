function [ returnImage ] = removeBorder( image )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [rows, cols, other] = size(image);
    lessRows = rows -1;
    lessCols = cols -1;
    returnImage = image(2:lessRows, 2:lessCols, :);
end

