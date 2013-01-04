function [gx, gy] = getGradientFeature( rgb )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    rgb_double = im2double(rgb);
    [gx, gy] = gradient(rgb_double);
end

