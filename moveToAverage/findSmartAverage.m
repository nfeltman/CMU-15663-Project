function [ avg, score ] = findSmartAverage( X, Y )
%FINDSMARTAVERAGE Summary of this function goes here
%   Detailed explanation goes here

o = ones(1,size(X,2));


beta = 5;
dists = sqrt(X.*X+Y.*Y);

weight = exp(-0.5*dists.*dists./(mean(dists,2).^2 * o));
% %weight = ones(size(X));
% a = weightedAvg(X.*X,weight);
% b = weightedAvg(X.*Y,weight);
% c = weightedAvg(Y.*Y,weight);
% [l2, s2, u ] = smallEigs(a,b,c);
% ux = u(:,1);
% uy = u(:,2);
% 
% fancy_len = sqrt((X.*(ux*o) + Y.*(uy*o)).^2./(l2*o) + (X.*(uy*o) - Y.*(ux*o)).^2./(s2*o));
% 
% valid = filterOutliers(fancy_len, 1);
% 
% validCount = sum(valid,2);
% % avgX = mean(X,2);
% % avgY = mean(Y,2);
% avgX = sum(X.*valid,2)./validCount;
% avgY = sum(Y.*valid,2)./validCount;
% avg = [avgX, avgY];
% 
% dotProd = (ux*o).*X + (uy*o).*Y;
% radial_weight = abs(dotProd)./(dists+2);
% a_part = 1-sqrt(s2./l2);
% dbar_part = weightedAvg(abs(dotProd),weight);
% vbar_part = weightedAvg(dotProd,valid);
% b_part = sqrt(weightedAvg((dotProd-vbar_part*o).^2, valid));
% score =  log(0.2+b_part.*dbar_part);
% 
% distBar = weightedAvg(dists,weight);
% distStd = sqrt(weightedAvg((dists-distBar*o).^2,weight));
% score = log(distBar./distStd+10);

[ meanX, meanY, majorVar, minorVar] = learnWeighting( X, Y, weight );
avg = [meanX, meanY];
score = log(sqrt(meanX.^2 + meanY.^2)+0.1);
%score = log(sqrt(meanX.^2 + meanY.^2)./sqrt(majorVar)+0.1);

end

