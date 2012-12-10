function [ newFeatureCell ] = increaseFeatureSize( featureEnum, featureCell, scale )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    newFeatureCell = featureCell;
    
    for drawingIndex = 1:size(featureCell,1)
       drawingCell = featureCell{drawingIndex};
       
       if ( size(drawingCell,1) > 0 )           
           newFeatureCell{drawingIndex}{featureEnum} = increaseSingleFeatureSize(drawingCell{featureEnum}, scale);
       end
    end
end


function [ newFeatureSize ] = increaseSingleFeatureSize(featureSize, scale)
disp('increase single feature size')
    newFeatureSize = featureSize
    newFeatureSize(:,3:4) = round(featureSize(:, 3:4) * scale)
    adjustOrigin = round((newFeatureSize(:,3:4) - featureSize(:,3:4))/2)
    newFeatureSize(:,1:2) = newFeatureSize(:,1:2) - adjustOrigin
end



