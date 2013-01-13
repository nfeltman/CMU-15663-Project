function [ avg, score ] = findSmartAverage( X, Y )
%FINDSMARTAVERAGE Summary of this function goes here
%   Detailed explanation goes here

o = ones(1,size(X,2));


beta = 5;
dists = sqrt(X.*X+Y.*Y);
meanDist = mean(dists,2);
stdDist = std(dists,[],2);
valid = (dists-meanDist*o)./(stdDist*o) < 2;

validCount = sum(valid,2);
% avgX = mean(X,2);
% avgY = mean(Y,2);
avgX = sum(X.*valid,2)./validCount;
avgY = sum(Y.*valid,2)./validCount;
avg = [avgX, avgY];


denom = dists.^2 + beta;

a = mean(X.*X,2);
b = mean(X.*Y,2);
c = mean(Y.*Y,2);
[l, s, U ] = smallEigs(a,b,c);
ux = U(:,1);
uy = U(:,2);

distStd = sqrt(sum((dists-(mean(dists,2)*o)).^2,2));

dotProd = (ux*o).*X + (uy*o).*Y;
%score = mean((1-(dotProd.*dotProd)./denom).^4,2)./(1+ 0.5*mean(dists,2)./distStd);
score = mean((dotProd.*dotProd)./denom,2);
% score = mean((1-(1)./denom).^4,2);
%score = 1./(1+ mean(dists,2)./distStd);
%score = 1./(10+sqrt(l));
score = sqrt(l)-sqrt(s+l);

end

