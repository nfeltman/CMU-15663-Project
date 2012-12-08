function [  ] = drawImageWithPrefix( imagePrefix )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [image_resize,X, Y] = getPositionsAdjusted(imagePrefix);
    strokeTypes = clasifyStrokes(imagePrefix);
    
    if size(X,1) > 0 
        imshow(image_resize);
        hold on
        drawImageStrokes(X,Y, strokeTypes);
%        drawImageWithXY(X, Y, strokeTypes);
        hold off;
    end
end
