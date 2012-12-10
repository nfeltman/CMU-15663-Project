function [ index, cell ] = getFeature( index, cell, strokeTypes, features, enumFeatureIndex, prefix )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
       [~,X, Y] = getPositionsAdjusted(prefix);
       
       drawingWithPadding = getAdjustedDrawing(prefix, X, Y);
       if ( size(drawingWithPadding, 1) == 0)
           return;
       end
       
       feature = features{enumFeatureIndex};
       
       %newEyeIndex = subplotFeatures(drawingWithPadding, eyes, X, Y, strokeTypes, eyeIndex, prefix);
       [index, cell] = populateEyeCell(drawingWithPadding, feature, X, Y, strokeTypes, index, cell);
end

function [index, cell] = populateEyeCell( image, features, X, Y, strokeTypes, index, cell)
    numberOfFeatures = size(features,1);
    for featureIndex = 1:numberOfFeatures
        feature  = features(featureIndex,:);
        [adjustedX, ~, ~] = strokesInFeature(X, Y, strokeTypes, feature);
        if ( size(adjustedX, 1) > 0 )
            eyeSubImage = im2double(subImageFromFeature(image, feature));
            cell{index} = eyeSubImage;
            index = index + 1;
        end
    end
end

function [inFeatureX, inFeatureY, inStrokeType] = strokesInFeature(X, Y, strokeType, feature)
    includeStroke = zeros(size(X,1), 1);
    
    for strokeIndex = 1:size(X,1)
        percent = classifyStrokeWithFeatureAndRectangle(X{strokeIndex}, Y{strokeIndex}, feature);
        if ( percent < .5 )
           includeStroke(strokeIndex, 1) = 0;
        else
           includeStroke(strokeIndex, 1) = 1;            
        end
    end
    
    inFeatureX = X(includeStroke ==1);
    inFeatureY = Y(includeStroke ==1);
    inStrokeType = strokeType(includeStroke == 1);
end

function [subImage] = subImageFromFeature(image, feature)
    subImage = image(feature(2):feature(2) + feature(4), feature(1):feature(1) + feature(3),:);
end




