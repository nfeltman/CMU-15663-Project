function [ Ivessel ] = getFrangiFilterFeature( gray )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    Id = double(gray);
    
    Ivessel=FrangiFilter2D(Id);
%    figure
 %   imshow(Ivessel,[0 0.25]);
end

