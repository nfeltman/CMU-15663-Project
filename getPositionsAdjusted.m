function [ image_resize, strokes ] = getPositionsAdjusted( imagePrefix )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    image_resize = [];
    strokes = {};

    imageName = drawAFriendFileName(imagePrefix, 'P');
    strokeFile = drawAFriendFileName(imagePrefix, 'S');

    if  exist(strokeFile, 'file')
        [strokes] = getPositions(strokeFile);
        if ( exist(imageName, 'file') )
            image = imread(imageName);
            image = im2double(image);
            [image_resize, offset_width, offset_height] = aspectRatio(image, 320, 460);
            [strokes] = adjustStrokesLocations(strokes, offset_width, offset_height);        
        end       
    end    
end

