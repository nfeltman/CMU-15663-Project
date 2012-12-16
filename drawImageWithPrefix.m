function [  ] = drawImageWithPrefix( imagePrefix )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [image_resize,strokes] = getPositionsAdjusted(imagePrefix);
    %strokeTypes = clasifyStrokes(imagePrefix);
    strokeTypes = [];
    
    if ( size(image_resize,1) == 0 )
       image_resize = zeros(460,320);
    end
    
    if size(strokes,1) > 0 
        imshow(zeros(size(image_resize)));
        hold on
        drawImageStrokes(strokes, strokeTypes, 'none');
        hold off;
    end
end
