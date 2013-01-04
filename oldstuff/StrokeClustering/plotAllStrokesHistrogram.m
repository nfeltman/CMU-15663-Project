function [ output_args ] = plotAllStrokesHistrogram( objectID )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    for objectIDIndex = 1:size(objectID,1)
       plotStrokehHistogram(objectID(objectIDIndex,:), objectIDIndex);
    end


end

