function [ newFeatureCell ] = increaseFeatureSize( featureEnum, featureCell, scale )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    newFeatureCell = featureCell;
    
    for drawingIndex = 1:size(featureCell,1)
       drawingCell = featureCell{drawingIndex};     
       newFeatureCell{drawingIndex}{featureEnum} = increaseSingleFeatureSize(drawingCell{featureEnum}, scale);       
    end
end




