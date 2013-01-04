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
    drawing = adjustMatrixToDrawing(prefixDrawingGray, X, Y);
end

