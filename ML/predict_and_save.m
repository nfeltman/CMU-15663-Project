function [ output_args ] = predict_and_save( directory, file_name, fullTree, saveDirectory )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    new_image = predictImage( directory, file_name, fullTree);
    imwrite(new_image, [saveDirectory, file_name], 'jpg');
end
