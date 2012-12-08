function [ drawing ] = getAdjustedDrawing(prefix, X, Y  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    drawing = [];
    
    drawingFileName = drawAFriendFileName(prefix, 'D');
    
    if ( ~exist(drawingFileName, 'file') )
        return;
    end
    
    [prefixDrawing, ~, ~] = imread(drawingFileName);
    prefixDrawingGray = rgb2gray(prefixDrawing);
    prefixDrawingGray = im2double(prefixDrawingGray);
    [x, y] = getMinimumStrokeLocation(X, Y);
    
    x = max(1,floor(x));
    y = max(1,floor(y));
    xEnd = x+size(prefixDrawingGray,2) - 1;
    yEnd = y+size(prefixDrawingGray,1) - 1;
    drawing = ones(max(yEnd, 460), max(xEnd, 320));
    drawing(y:yEnd,x:xEnd) = prefixDrawingGray;
    
end

