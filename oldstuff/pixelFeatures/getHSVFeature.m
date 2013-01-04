function [ h, s, v ] = getHSVFeature( rgb_image )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    hsv_image = rgb2hsv(rgb_image);
    h = hsv_image(:,:,1);
    s = hsv_image(:,:,2);
    v = hsv_image(:,:,3);
end

