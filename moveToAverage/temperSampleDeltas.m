function [ newD ] = temperSampleDeltas( d )
%MOVESTROKE Summary of this function goes here
%   Detailed explanation goes here

dnorm = sqrt(sum(abs(d).^2,2));
modulation = max(1-dnorm/20,0);
weighting = modulation;

newD = [d .* ((modulation.*weighting) * [1 1]), weighting];

end

