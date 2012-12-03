function [ drawing ] = createImageFromPrefix( prefix )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    fileName = drawAFriendFileName(prefix, 'P');
    image = imread(fileName);
    imshow(image);
    drawing = image;


end

