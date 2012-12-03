function [ X, Y ] = adjustStrokesLocations( X, Y, width_offset, height_offset )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
	strokeCount = size(X, 1);
    for strokeIndex = 1:strokeCount
       X{strokeIndex} = X{strokeIndex} - width_offset;
       Y{strokeIndex} = Y{strokeIndex} - height_offset;
    end    
end

