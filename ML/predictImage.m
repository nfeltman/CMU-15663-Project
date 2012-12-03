function [ new_image ] = predictImage( directory, file_name, fullTree )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    full_file = [directory, file_name];
    [features, files_size] = createFeaturesFromImage(full_file);
   % predict = eval(fullTree, features);
    predict = fullTree.eval(features);
    if ~isnumeric(predict(1,1))
       predict = str2double(predict); 
    end
    
    new_image = reshape(predict, files_size );
    % imshow(new_image);
end

