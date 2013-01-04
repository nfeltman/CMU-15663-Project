function [ features, label ] = createLabelFeatureCombo( prefix )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    label = createLabelFromImage(prefix);
    [features, ~] = createFeaturesFromImage(prefix);
    %size(features)
    %size(label)
end

