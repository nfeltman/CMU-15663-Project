function [ X, Y, lens] = normalizeDeltas( X, Y )
%NORMALIZEDELTAS Normalize the inputs and give the lengths
%   Detailed explanation goes here

lens = sqrt(X.^2+Y.^2);
X = X./lens;
Y = Y./lens;

end

