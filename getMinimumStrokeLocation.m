function [ x,y ] = getMinimumStrokeLocation( X, Y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    x = inf;
    y = inf;
    for strokeIndex = 1:size(X,1)
        minX = min(X{strokeIndex});
        minY = min(Y{strokeIndex});
        
        x = min(minX, x);
        y = min(minY, y);
    end
end

