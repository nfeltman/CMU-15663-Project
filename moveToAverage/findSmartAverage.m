function [ avg, score ] = findSmartAverage( X, Y )
%FINDSMARTAVERAGE Summary of this function goes here
%   Detailed explanation goes here

o = ones(1,size(X,2));


beta = 5;
dists = sqrt(X.*X+Y.*Y);

weight = exp(-dists.*dists./(mean(dists,2).^2 * o));
% weight = ones(size(X));
a = weightedAvg(X.*X,weight);
b = weightedAvg(X.*Y,weight);
c = weightedAvg(Y.*Y,weight);
[l2, s2, u ] = smallEigs(a,b,c);
ux = u(:,1);
uy = u(:,2);

fancy_len = sqrt((X.*(ux*o) + Y.*(uy*o)).^2./(l2*o) + (X.*(uy*o) - Y.*(ux*o)).^2./(s2*o));

valid = filterOutliers(fancy_len, 1);

validCount = sum(valid,2);
% avgX = mean(X,2);
% avgY = mean(Y,2);
avgX = sum(X.*valid,2)./validCount;
avgY = sum(Y.*valid,2)./validCount;
avg = [avgX, avgY];


dotProd = (ux*o).*X + (uy*o).*Y;
a_part = 1-sqrt(s2./l2);
vbar_part = weightedAvg(dotProd,weight);
dbar_part = weightedAvg(abs(dotProd),weight);
b_part = sqrt(weightedAvg((dotProd-vbar_part*o).^2, weight));
score =  b_part;

end

