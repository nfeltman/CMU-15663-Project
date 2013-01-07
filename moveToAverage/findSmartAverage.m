function [ avg, smartAvg, score ] = findSmartAverage( X, Y )
%FINDSMARTAVERAGE Summary of this function goes here
%   Detailed explanation goes here

n = size(X,1);
o = ones(1,size(X,2));

[V, score] = findOptimumCone(X,Y);

VX = V(:,1);
VY = V(:,2);

avgX = mean(X,2);
avgY = mean(Y,2);

dotprod = VX.*avgX + VY.*avgY;
avg = [avgX, avgY];
smartAvg = [VX.*dotprod, VY.*dotprod];
smartAvg = [avgX.*score, avgY.*score];

end

