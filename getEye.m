function [ eyeIndex, eyeCell ] = getEye( prefix, eyeIndex, eyeCell )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
        newEyeIndex = eyeIndex;
       [image_resize,X, Y] = getPositionsAdjusted(prefix);
       [strokeTypes, face, nose, mouth, eyes, eyePairSmall, upperBody] = clasifyStrokes(prefix);    
       X_eye = X(strokeTypes == enumFeature('eye'), :);
       Y_eye = Y(strokeTypes == enumFeature('eye'), :);
       strokeTypes_eye = strokeTypes(strokeTypes == enumFeature('eye'),:);
       
       drawingWithPadding = getAdjustedDrawing(prefix, X, Y);
       if ( size(drawingWithPadding, 1) == 0)
           return;
       end
       
       
       %newEyeIndex = subplotFeatures(drawingWithPadding, eyes, X, Y, strokeTypes, eyeIndex, prefix);
       [eyeIndex, eyeCell] = populateEyeCell(drawingWithPadding, eyes, X, Y, strokeTypes, eyeIndex, eyeCell, prefix);
       
       %eyeOnes = setOnesWhereBoxesAre(image_resize, eyes);
       
       %testEye = drawingWithPadding(1:size(eyeOnes,1), 1:size(eyeOnes,2));
       %size(testEye)
       %size(eyeOnes)
       %testEye(~eyeOnes(:,:,1)) = 0;
       
      % imshow(testEye);
       
       
       
       
      % imshow(image_resize);
      % hold on;
       %drawImageStrokes(X_eye, Y_eye, strokeTypes_eye);
      % hold off;
end

function [newOnes] = setOnesWhereBoxesAre(image, features)
   newOnes = zeros(size(image));
   
   for featureIndex = 1:size(features,1)
       feature = features(featureIndex,:);
       newOnes(feature(2):feature(2) + feature(4), feature(1):feature(1) + feature(3),:) = 1;
   end
   
   size(newOnes)

end

function [eyeIndex, eyeCell] = populateEyeCell( image, features, X, Y, strokeTypes, eyeIndex, eyeCell, prefix)
    numberOfFeatures = size(features,1);
    for featureIndex = 1:numberOfFeatures
        feature  = features(featureIndex,:);
        [adjustedX, adjustedY, adjustedStrokeType] = strokesInFeature(X, Y, strokeTypes, feature);
        if ( size(adjustedX, 1) > 0 )
            [adjustedX, adjustedY] = adjustStrokesByFeature(feature, adjustedX, adjustedY);    
            eyeSubImage = im2double(subImageFromFeature(image, feature));
            eyeCell{eyeIndex} = eyeSubImage;
            eyeIndex = eyeIndex + 1;
        end
        
    end

end
    

function [eyeIndex] = subplotFeatures(image, features, X, Y, strokeTypes, eyeIndex, prefix)
    numberOfFeatures = size(features,1);
    for featureIndex = 1:numberOfFeatures
        feature  = features(featureIndex,:);
        [adjustedX, adjustedY, adjustedStrokeType] = strokesInFeature(X, Y, strokeTypes, feature);
        [adjustedX, adjustedY] = adjustStrokesByFeature(feature, adjustedX, adjustedY);
        if ( size(adjustedX, 1) > 0 )
            subplot(10,10, eyeIndex);
            hold on
            imshow(im2double(subImageFromFeature(image, feature)));
            %drawImageStrokes(adjustedX, adjustedY, adjustedStrokeType);
            hold off
            eyeIndex = eyeIndex + 1;
        end
    end
end

function [subImage] = subImageFromFeature(image, feature)
    subImage = image(feature(2):feature(2) + feature(4), feature(1):feature(1) + feature(3),:);
end

function [adjustedX, adjustedY] = adjustStrokesByFeature(feature, X, Y)
    adjustedX = X;
    adjustedY = Y;
    
    for strokeIndex = 1:size(X,1)
        adjustedX{strokeIndex} = X{strokeIndex} - feature(1);
        adjustedY{strokeIndex} = Y{strokeIndex} - feature(2); 
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

