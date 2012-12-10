function [ newFace, newNose, newEyes, newMouth ] = getBestFeatures( face, nose, eyes, mouth )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
    newNose = [];
    newEyes = [];
    newMouth = [];
    newFace = face;
    
    noseCell = {};
    eyesCell = {};
    mouthCell = {};
    
    for faceIndex = 1:size(face,1)
        thisNose = nose;
        thisEyes = eyes;
        thisMouth = mouth;
        
        thisNose = findIntersectingRectangles(face(faceIndex,:), thisNose);
        thisEyes = findIntersectingRectangles(face(faceIndex,:), thisEyes);
        thisMouth = findIntersectingRectangles(face(faceIndex,:), thisMouth);
        
        noseCell{faceIndex} = thisNose;
        eyesCell{faceIndex} = thisEyes;
        mouthCell{faceIndex} = thisMouth;
        
    end
    
    for faceIndex = 1:size(noseCell,2)
        bottomMouth = chooseBottomMouth(mouthCell{faceIndex});
       [bettereyes, ~] = noEyesInMouth(bottomMouth, eyesCell{faceIndex});
       [bettereyes] = noEyesBelowNose(bettereyes, noseCell{faceIndex});
       bettereyes = noOverlappingEyes(bettereyes);
        
        newNose = [newNose; noseCell{faceIndex}];
        newEyes = [newEyes; bettereyes];
        newMouth = [newMouth; bottomMouth];        
    end
end

function [overlappEyes] = noOverlappingEyes(eyes)
    
    includeEyes = ones(size(eyes,1), 1) == 1;
    
    for firstEyeIndex = 1:size(eyes,1);
        firstEye = eyes(firstEyeIndex, :);
       for secondEyeIndex = firstEyeIndex+1:size(eyes,1)
           secondEye = eyes(secondEyeIndex, :);
           interSects = findIsInside(firstEye, secondEye);
           doesNotIntersect = interSects == 0;
           includeEyes(secondEyeIndex) = includeEyes(secondEyeIndex) & doesNotIntersect;
       end
    end
    
    overlappEyes = eyes(includeEyes,:);
end

function [bottomMouth] = chooseBottomMouth(mouth)
    bottomMouth = mouth;

    if ( size(mouth,1) < 2 )
        bottomMouth = mouth;
        return;
    end

   [~, maxYIndex] = max(mouth(:,2));
   bottomMouth = mouth(maxYIndex,:);
end

function [newEyes, newMouth] = noEyesInMouth(mouth, eyes)

    newEyes = eyes;
    newMouth = mouth;
    
    if ( size(eyes,1) == 0 || size(mouth,1) == 0 )
        newEyes = eyes;
        return;
    end
        
    eyesHitMouth = findIntersectingIndex(mouth, eyes) == 1;
    
    newEyes(eyesHitMouth,:) = [];
end

function [newEyes] = noEyesBelowNose(eyes, nose)
newEyes = eyes;
    if ( size(nose,1) == 0 || size(eyes,1) == 0)
        return;
    end
    belowNose = eyes(:,2) > nose(1,2);
    newEyes = eyes;
    newEyes(belowNose, :) = [];
end

function [intersectingRectangles] = findIntersectingRectangles(face, features)
    intersectingRectangles = features;
    includeFeatures = findIntersectingIndex(face, features);
    intersectingRectangles(~includeFeatures, :) = [];
end

function [intersectingIndex] = findIntersectingIndex(oneFeature, features)
        intersectingIndex = ones(size(features,1), 1);
        
        [one_left, one_right, one_up, one_down] = getRectangleCoords(oneFeature);

    for featureIndex = 1:size(features,1)
        feature = features(featureIndex, :);
        [feature_left, feature_right, feature_up, feature_down] = getRectangleCoords(feature);
        
        if ( one_right < feature_left || one_left > feature_right || one_up < feature_down || one_down > feature_up )
            intersectingIndex(featureIndex) = 0;
        end
    end    
end

function [isInside] = findIsInside(oneFeature, features)
    isInside = ones(size(features,1),1) == 1;
    [one_left, one_right, one_up, one_down] = getRectangleCoords(oneFeature);
    
    for featureIndex = 1:size(features,1)
       [centerX, centerY] = getCenterCoords(features(featureIndex,:));
       isInside(featureIndex) = centerX > one_left && centerX < one_right && centerY > one_down && centerY < one_up;
    end
end

function [left, right, up , down] = getRectangleCoords(featureRectangle)
    left = featureRectangle(1);
    right = left + featureRectangle(3);
    down = featureRectangle(2);
    up = down + featureRectangle(4);
end

function [centerX, centerY] = getCenterCoords(featureRectangle)
    left = featureRectangle(1);
    right = left + featureRectangle(3)/2;
    down = featureRectangle(2);
    up = down + featureRectangle(4)/2;
    
    centerX = right;
    centerY = up;
end





