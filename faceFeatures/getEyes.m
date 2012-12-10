function [ eyeCell ] = getEyes( objectIds, numberOfEyes )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    eyeIndex = 1;
    eyeCell = {};
    for objectIDIndex = 1:size(objectIds,1)
        if ( eyeIndex < numberOfEyes )

            objectID = objectIds(objectIDIndex,:);
            disp(objectID);
            
            [strokeTypes, features] = clasifyStrokes(objectID);
            [ eyeIndex, eyeCell ] = getFeature( eyeIndex, eyeCell, strokeTypes, features, enumFeature('eye'), objectID );

            %[eyeIndex, eyeCell] = getEye(objectID, eyeIndex, eyeCell);

        end
        
    end
end

