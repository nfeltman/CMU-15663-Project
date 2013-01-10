function [ U, score ] = findOptimumCone( X, Y )
%FINDOPTIMUMCONE Summary of this function goes here
%   Detailed explanation goes here

a = sum(X.*X,2);
b = sum(X.*Y,2);
c = sum(Y.*Y,2);

smaller_eig = (a+c - sqrt((a-c).^2+4*b.*b)) / 2;

ux = a - smaller_eig;
uy = b;
uLen = sqrt(ux.*ux+uy.*uy);
ux = ux./uLen;
uy = uy./uLen;
U = [ux, ux];


alpha = 6;
beta = 2;

o = ones(1,size(X,2));
dotProd = (ux*o).*Y - (uy*o).*X;
denom = sqrt(X.*X+Y.*Y) + beta;
score = mean((1-abs(dotProd)./denom).^alpha,2);

% 
% alpha = 0.1;
% beta = 2;
% epsilon = 2;
% 
% o = ones(1,size(X,2));
% vLen = sqrt(X.*X+Y.*Y);
% numer = 1-abs(((ux*o).*Y - (uy*o).*X)./vLen);
% denom = alpha*(vLen.^beta) + epsilon;
% score = mean(numer./denom,2);

end

