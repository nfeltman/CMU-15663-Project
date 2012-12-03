function [ output_args ] = predictAll( directory, files, fullTree, saveDirectory )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    for i = 1:size(files,1)
       predict_and_save(directory, files(i).name, fullTree, saveDirectory);
    end
end

