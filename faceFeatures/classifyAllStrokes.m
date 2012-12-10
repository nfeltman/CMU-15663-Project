function [ strokeTypeCell, featureCell ] = classifyAllStrokes( objectIds )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    strokeTypeCell = cell(size(objectIds,1),1);
    featureCell = cell(size(objectIds,1),1);

    for objectIDIndex = 1:size(objectIds,1)
        objectID = objectIds(objectIDIndex,:);
        disp(objectID);
        [strokeTypeCell{objectIDIndex}, featureCell{objectIDIndex}] = clasifyStrokes(objectID);            
    end
end

