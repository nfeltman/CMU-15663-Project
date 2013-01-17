function [ meanX, meanY, majorVar, minorVar, axisX, axisY ] = learnWeighting( X, Y, bootstrap_weight )
%LEARNWEIGHTING Summary of this function goes here
%   Detailed explanation goes here

o = ones(1,size(X,2));
d = size(X,2);

weight = bootstrap_weight;

for k = 1:10
    % M step
    meanX = weightedAvg(X,weight);
    meanY = weightedAvg(Y,weight);
    meanDist = sqrt(meanX.*meanX+meanY.*meanY);

    axisX = meanX./meanDist;
    axisY = meanY./meanDist;

    shiftedX = (X-meanX*o);
    shiftedY = (Y-meanY*o);

    majorLen = shiftedX.*(axisX*o)+shiftedY.*(axisY*o);
    minorLen = shiftedX.*(axisY*o)-shiftedY.*(axisX*o);

    majorVar = weightedAvg(majorLen.^2, weight)+0.0001;
    minorVar = weightedAvg(minorLen.^2, weight)+0.0001;
    
    tau = (sum(weight,2)+5)./(d+5);
    
    % E step
    relativeVar = majorLen.^2./(majorVar*o) + minorLen.^2./(minorVar*o);

    prob = exp(relativeVar*(-0.5))./(2*pi*sqrt(majorVar.*minorVar)*o);
    
    %weight = (prob.*(tau*o))./(prob.*(tau*o) + (1 - tau*o));
    weight = prob./(prob+0.05);
end

end

