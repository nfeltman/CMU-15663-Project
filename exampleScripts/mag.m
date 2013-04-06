function [ sqrted ] = mag( v )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    squared = v .* v;
    sumed = sum(squared,2);
    sqrted = sqrt(sumed);
end

