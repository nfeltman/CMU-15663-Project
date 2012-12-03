function [ feature_label ] = createLabelFeatureCombo( prefix )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    label = createLabelFromImage(prefix);
    features = createFeaturesFromImage(image_file);
    feature_label = [features, label];
end

