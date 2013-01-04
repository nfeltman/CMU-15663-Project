function [ drawing ] = adjustMatrixToDrawing( aMatrix, X, Y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [x, y] = getMinimumStrokeLocation(X, Y);
    x = max(1,floor(x));
    y = max(1,floor(y));
    xEnd = x+size(aMatrix,2) - 1;
    yEnd = y+size(aMatrix,1) - 1;
    drawing = ones(max(yEnd, 460), max(xEnd, 320));
    drawing(y:yEnd,x:xEnd) = aMatrix;
end

