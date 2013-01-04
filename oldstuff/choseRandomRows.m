function [ smallFeature, smallLabel ] = choseRandomRows( features, labels, pZero, pOne )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    n = size(features,1);
    selection = (labels == 0 & rand(n, 1) < pZero) | (labels == 1 & rand(n, 1) < pOne);
    smallFeature = features(selection, :);
    smallLabel = labels(selection);
end

