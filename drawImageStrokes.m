function [  ] = drawImageStrokes( X, Y, strokeTypes )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
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
        
        color = 'black';
        
        line(X_stroke, Y_stroke, 'Color', color );
        %imline(gca, X_stroke - offset_width, Y_stroke - offset_height);
   end
end