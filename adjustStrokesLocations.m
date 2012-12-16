function [ strokes ] = adjustStrokesLocations( strokes, width_offset, height_offset )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
	strokeCount = size(strokes, 1);
    for strokeIndex = 1:strokeCount
       strokes{strokeIndex}(:,1) = strokes{strokeIndex}(:,1) - width_offset;
       strokes{strokeIndex}(:,2) = strokes{strokeIndex}(:,2) - height_offset;
    end    
end

