function [ avgX ] = weightedAvg( X, W )
%WEIGHTEDAVG Summary of this function goes here
%   Detailed explanation goes here

avgX = sum(W.*X,2)./sum(W,2);

end

