function [ strokeType, features ] = clasifyStrokes( prefix )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    [ features] = getFaceFeatures( prefix );
    [~,X, Y] = getPositionsAdjusted(prefix);
        
    strokeType = zeros(size(X,1), 1);
    
    for strokeIndex = 1:size(X,1)
%    for strokeIndex = 34
       Xs = X{strokeIndex};
       Ys = Y{strokeIndex};
      
       
       nosePer = classifyStrokeWithFeatureAndRectangles(Xs, Ys, features{enumFeature('nose')});
       
       mouthPer = classifyStrokeWithFeatureAndRectangles(Xs, Ys, features{enumFeature('mouth')});
       
       eyePer = classifyStrokeWithFeatureAndRectangles(Xs, Ys, features{enumFeature('eye')});
       
       facePer = classifyStrokeWithFeatureAndRectangles(Xs, Ys, features{enumFeature('face')});
       
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

function [ percent ] = classifyStrokeWithFeatureAndRectangles(Xs, Ys, rectangles)
    percent = 0;
    
    for rectangleIndex = 1:size(rectangles,1);
       newPercent = classifyStrokeWithFeatureAndRectangle(Xs, Ys, rectangles(rectangleIndex,:));
       percent = max(newPercent, percent);
    end
end









