function [  ] = drawImageWithPrefix( imagePrefix )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [image_resize,X, Y] = getPositionsAdjusted(imagePrefix);
    strokeTypes = clasifyStrokes(imagePrefix);
    
    if size(X,1) > 0 
        imshow(image_resize);
        hold on
        % drawImageWithXY(X, Y, offset_width, offset_height);
        drawImageWithXY(X, Y, 0, 0, strokeTypes);
        hold off;
    end
end

function [] = drawImageWithXY(X, Y, offset_width, offset_height, strokeTypes)
    numberOfStrokes = size(X,1);
    numberOfColors = 32;
    strokeValue = ceil(numberOfStrokes/numberOfColors);
    colorMap = jet(32);
    
   for strokeIndex = 1:numberOfStrokes
%   for strokeIndex = 34
 
        strokeType = strokeTypes(strokeIndex);
       
       % colorIndex = ceil(strokeIndex/strokeValue);
       % color = colorMap(colorIndex,:);
        color = colorFromFeatureEnum(strokeType);
       
        X_stroke = X(strokeIndex);
        X_stroke = X_stroke{1};
        
        Y_stroke = Y(strokeIndex);
        Y_stroke = Y_stroke{1};
        
        line(X_stroke - offset_width, Y_stroke - offset_height, 'Color', color );
        %imline(gca, X_stroke - offset_width, Y_stroke - offset_height);
    end
end

