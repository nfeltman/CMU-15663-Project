function [  ] = drawImageStrokes( strokes, strokeTypes, drawType)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    numberOfStrokes = size(strokes,1);
    numberOfColors = 32;

    for strokeIndex = 1:numberOfStrokes
%   for strokeIndex = 34
        stroke = strokes{strokeIndex};
        
        
        X_stroke = stroke(:,1);        
        Y_stroke = stroke(:,2);
        
        color = getColorWithDrawType(drawType, strokeTypes,stroke, strokeIndex);
        
        line(X_stroke, Y_stroke, 'Color', color );
        %imline(gca, X_stroke - offset_width, Y_stroke - offset_height);
   end
end

function [color] = getColorWithDrawType(drawType, strokeTypes, strokes, strokeIndex)
    if strcmp(drawType, 'length')
        colorMap = jet(20);
        distance = cellDistance(strokes{strokeIndex});
        distanceIndex = ceil(distance/50);
        distanceIndex = max(distanceIndex, 1);
        distanceIndex = min(distanceIndex, 20);
        color = colorMap(distanceIndex,:);
    elseif strcmp(drawType, 'cluster')
        colorMap = jet(max(strokeTypes));
        strokeType = strokeTypes(strokeIndex);
        if isnan(strokeType) 
            color = 'white';
        else
            color = colorMap(strokeTypes(strokeIndex),:);
        end
    elseif strcmp(drawType, 'face')
        strokeType = strokeTypes(strokeIndex);
        color = colorFromFeatureEnum(strokeType);        
    else
        color = 'yellow';
    end
end