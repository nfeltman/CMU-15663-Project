function [ strokeType, features ] = clasifyStrokes( prefix )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    [ features] = getFaceFeatures( prefix );
    
    if size(features,1) == 0
       strokeType = [];
       return;
    end
    [~,strokes] = getPositionsAdjusted(prefix);
        
    strokeType = zeros(size(strokes,1), 1);
    
    for strokeIndex = 1:size(strokes,1)
%    for strokeIndex = 34
       stroke = strokes{strokeIndex};      
       
       nosePer = classifyStrokeWithFeatureAndRectangles(stroke, features{enumFeature('nose')});
       
       mouthPer = classifyStrokeWithFeatureAndRectangles(stroke, features{enumFeature('mouth')});
       
       eyePer = classifyStrokeWithFeatureAndRectangles(stroke, features{enumFeature('eye')});
       
       facePer = classifyStrokeWithFeatureAndRectangles(stroke, features{enumFeature('face')});
       
       featurePercent = [];
       featurePercent(enumFeature('nose')) = nosePer;
       featurePercent(enumFeature('mouth')) = mouthPer;
       featurePercent(enumFeature('eye')) = eyePer;
       [maxValue, maxIndex] = max(featurePercent);
       
       if ( maxValue < .50 )
           maxIndex = 0;
       end
       
       if ( maxValue == 0 && facePer > .2 )
           maxIndex = enumFeature('face');
       end
           
       
       strokeType(strokeIndex) = maxIndex;
    end    
end

function [ percent ] = classifyStrokeWithFeatureAndRectangles(stroke, rectangles)
    percent = 0;
    
    for rectangleIndex = 1:size(rectangles,1);
       newPercent = classifyStrokeWithFeatureAndRectangle(stroke, rectangles(rectangleIndex,:));
       percent = max(newPercent, percent);
    end
end









