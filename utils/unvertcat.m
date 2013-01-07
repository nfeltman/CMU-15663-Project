function [ unmerged ] = unvertcat( merged, h )
%UNVERTCAT Summary of this function goes here
%   Detailed explanation goes here

unmerged = mat2cell(merged,h,size(merged,2));

end

