function [ image_resize, X, Y ] = getPositionsAdjusted( imagePrefix )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    X = [];
    Y = [];
    image_resize = [];

    imageName = drawAFriendFileName(imagePrefix, 'P');
    strokeFile = drawAFriendFileName(imagePrefix, 'S');

    if exist(imageName, 'file') && exist(strokeFile, 'file')
        image = imread(imageName);
        image = im2double(image);
        
        [X, Y] = getPositions(strokeFile);
        [image_resize, offset_width, offset_height] = aspectRatio(image, 320, 460);
        [X,Y] = adjustStrokesLocations(X, Y, offset_width, offset_height);
    end
end

