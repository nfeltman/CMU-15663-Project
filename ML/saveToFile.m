function [ output_args ] = saveToFile( image_file, drawing_file, file_name )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    feature_label = createLabelFeatureCombo(drawing_file(1,:), image_file(1,:));
    feature_label_small = choseRandomRows(feature_label, .01);
    dlmwrite(file_name, feature_label_small, 'delimiter', ' ');
    output_args = feature_label_small;
end

