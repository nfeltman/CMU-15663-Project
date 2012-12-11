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
       [index, cell] = populateEyeCell(prefix,drawingWithPadding, feature, X, Y, strokeTypes, index, cell);
       
end

function [index, cell] = populateEyeCell( prefix,image, features, X, Y, strokeTypes, index, cell)
   %[imFlowX, imFlowY] = createImageFlow(prefix);
    
    numberOfFeatures = size(features,1);
    for featureIndex = 1:numberOfFeatures
        feature  = features(featureIndex,:);
        [adjustedX, ~, ~] = strokesInFeature(X, Y, strokeTypes, feature);
        if ( size(adjustedX, 1) > 0 )
            eyeSubImage = im2double(subImageFromFeature(image, feature));
            %imFlowXSub = subImageFromFeature(imFlowX, feature);
            %imFlowYSub = subImageFromFeature(imFlowY, feature);
            
            if ( size(eyeSubImage,1) > 0 )
                cell{index} = eyeSubImage;
                %cell{index} = [imFlowXSub, imFlowYSub];
                index = index + 1;
            end
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
    minY = feature(2);
    maxY = feature(2) + feature(4);
    minX = feature(1);
    maxX = feature(1) + feature(3);
    
    if ( isInBounds(image, minX, minY, maxX, maxY) )
        subImage = image(minY:maxY, minX:maxX,:);
    else
       subImage = []; 
    end
end

function [inBounds] = isInBounds(image, minX, minY, maxX, maxY)
    inBounds = minX > 0 && minY > 0 && maxX <= size(image,2) && maxY <= size(image,1);
end




