function [ image_resize, strokes ] = getPositionsAdjusted( imagePrefix )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    imageName = drawAFriendFileName(imagePrefix, 'P');
    strokeFile = drawAFriendFileName(imagePrefix, 'S');
    if ( ~exist(imageName, 'file') )
        error('Image files does not exist!');
    end
    image = imread(imageName);
    image = im2double(image);
    
    [strokes] = getPositions(strokeFile);
    [image_resize, offset_width, offset_height] = aspectRatio(image, 320, 460);
    [strokes] = adjustStrokesLocations(strokes, offset_width, offset_height);        

end

