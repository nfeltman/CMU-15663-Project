function [ valid, cutoff ] = filterOutliers( dists, z )
%FILTEROUTLIERS Summary of this function goes here
%   Detailed explanation goes here

o = ones(1,size(dists,2));
quartiles = prctile(dists,[20 75],2);
stdDist = std(dists,[],2);
med = median (dists,2);
cutoff = quartiles;
valid = dists > cutoff(:,1) * o & dists < cutoff(:,2)*o;

end

