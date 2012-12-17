function [ strokes ] = adjustStrokesLocations( strokes, width_offset, height_offset, scale )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    if nargin < 4,
        scale = 1;
    end

	strokeCount = size(strokes, 1);
    for strokeIndex = 1:strokeCount
       strokes{strokeIndex}(:,1) = (strokes{strokeIndex}(:,1) - width_offset)*scale;
       strokes{strokeIndex}(:,2) = (strokes{strokeIndex}(:,2) - height_offset)*scale;
    end    
end

