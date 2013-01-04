function [ newFeature ] = increaseSingleFeatureSize( feature, scale )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here       
        if ( size(feature,1) > 0 )
           if ( size(scale,1) == 0 )
                newFeature = makeFeatureSquare(feature);
           else
                newFeature = increaseSingleFeatureSize(feature, scale);
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

function [newFeatureSize] = makeFeatureSquare(featureSize)
    newFeatureSize = featureSize;
    squareSizes = max(featureSize(:,3:4)')';
    newFeatureSize(:,3:4) = repmat(squareSizes, 1, 2);
    adjustOrigin = round((newFeatureSize(:,3:4) - featureSize(:,3:4))/2);
    newFeatureSize(:,1:2) = newFeatureSize(:,1:2) - adjustOrigin;
end

