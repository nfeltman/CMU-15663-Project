function [ dx ] = diff1( x )
%DIFF1 Summary of this function goes here
%   Detailed explanation goes here

dx = x(2:end,:) - x(1:end-1,:);

end

