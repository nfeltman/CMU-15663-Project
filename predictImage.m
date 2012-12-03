function [ new_image ] = predictImage( directory, prefix, fullTree )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    [features, files_size] = createFeaturesFromImage(prefix);
   % predict = eval(fullTree, features);
    predict = fullTree.eval(features);
    if ~isnumeric(predict(1,1))
       predict = str2double(predict); 
    end
    
    new_image = reshape(predict, files_size );
    % imshow(new_image);
end

