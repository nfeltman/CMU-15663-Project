function [ Ivessel ] = getFrangiFilterFeature( gray )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    RGB = imread('1103941_2520703493728906168_image.jpg');
    Id = double(gray);
    Ivessel=FrangiFilter2D(Id);
%    figure
 %   imshow(Ivessel,[0 0.25]);
end

