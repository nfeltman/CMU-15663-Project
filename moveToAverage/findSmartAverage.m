function [ avg, score ] = findSmartAverage( X, Y )
%FINDSMARTAVERAGE Summary of this function goes here
%   Detailed explanation goes here

o = ones(1,size(X,2));

avgX = mean(X,2);
avgY = mean(Y,2);
avg = [avgX, avgY];

beta = 0.75;
dists = sqrt(X.*X+Y.*Y);
denom = dists.^2 + beta;

[~, ~, U ] = smallEigs(sum(X.*X,2),sum(X.*Y,2),sum(Y.*Y,2));
ux = U(:,1);
uy = U(:,2);

distStd = sqrt(sum((dists-(mean(dists,2)*o)).^2,2));

dotProd = (ux*o).*Y - (uy*o).*X;
score = mean((1-(dotProd.*dotProd)./denom).^4,2)./(1+ 0.5*mean(dists,2)./distStd);

end

