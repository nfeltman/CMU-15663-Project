function [ strokeType ] = clasifyStrokes( prefix )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    [ face, nose, mouth, leftEye, rightEye, eyePairSmall, upperBody ] = getFaceFeatures( prefix );
    [~,X, Y] = getPositionsAdjusted(prefix);
        
    eye = [leftEye; rightEye];
   
    strokeType = zeros(size(X,1), 1);
    
    for strokeIndex = 1:size(X,1)
%    for strokeIndex = 34
       Xs = X{strokeIndex};
       Ys = Y{strokeIndex};
      
       nosePer = classifyStrokeWithFeatureAndRectangles(Xs, Ys, nose);
       mouthPer = classifyStrokeWithFeatureAndRectangles(Xs, Ys, mouth);
       eyePer = classifyStrokeWithFeatureAndRectangles(Xs, Ys, eye);
       facePer = classifyStrokeWithFeatureAndRectangle(Xs, Ys, face)
       
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

function [ percent ] = classifyStrokeWithFeatureAndRectangle(Xs, Ys, rectangle)
    x_min = rectangle(1);
    y_min = rectangle(2);
    x_max = rectangle(3) + x_min;
    y_max = rectangle(4) + y_min;

    
    gtX = Xs > x_min;
    gtY = Ys > y_min;
    ltX = Xs < x_max;
    ltY = Ys < y_max;
    
    insideBox = gtX & gtY & ltX & ltY;
    
    percent = sum(insideBox) ./ size(insideBox,1);
end








