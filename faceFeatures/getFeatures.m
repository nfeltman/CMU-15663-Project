function [ featureImages ] = getFeatures( strokeTypeCell, featureCell, objectIds )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    featureImages = {};

    for enumIndex = 1:enumFeature('all')
        index = 1;
        featureImages{enumIndex} = {};
        for objectIDIndex = 1:size(objectIds,1)
            objectID = objectIds(objectIDIndex,:);
            disp(objectID);
            
            strokeTypes = strokeTypeCell{objectIDIndex};
            features = featureCell{objectIDIndex};
                    
            [ index, featureImages{enumIndex} ] = getFeature( index, featureImages{enumIndex}, strokeTypes, features, enumIndex, objectID );
        end
    end
end

