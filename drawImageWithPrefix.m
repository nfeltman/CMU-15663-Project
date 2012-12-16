function [  ] = drawImageWithPrefix( imagePrefix )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [image_resize,X, Y] = getPositionsAdjusted(imagePrefix);
    %strokeTypes = clasifyStrokes(imagePrefix);
    strokeTypes = [];
    
    if ( size(image_resize,1) == 0 )
       image_resize = zeros(460,320);
    end
    
    if size(X,1) > 0 
        %imshow(image_resize);
        imshow(zeros(size(image_resize)));
        hold on
        drawImageStrokes(X,Y, strokeTypes, 'none');
        hold off;
    end
end
