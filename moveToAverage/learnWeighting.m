function [ meanX_all, meanY_all ] = learnWeighting( X_all, Y_all, bootstrap_weight )
%LEARNWEIGHTING Summary of this function goes here
%   Detailed explanation goes here

n = size(X_all,1);
meanX_all = zeros(n,1);
meanY_all = zeros(n,1);

o = ones(1,size(X_all,2));
d = size(X_all,2);

block_size = 512;
for start_ind = 1:block_size:n
    range = start_ind:min(start_ind+block_size-1,n);

    weight = bootstrap_weight(range,:);
    X = X_all(range,:);
    Y = Y_all(range,:);

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

        %tau = (sum(weight,2)+5)./(d+5);

        % E step
        relativeVar = majorLen.^2./(majorVar*o) + minorLen.^2./(minorVar*o);

        prob = exp(relativeVar*(-0.5))./(2*pi*sqrt(majorVar.*minorVar)*o);

        %weight = (prob.*(tau*o))./(prob.*(tau*o) + (1 - tau*o));
        weight = prob./(prob+0.05);
    end
    
    meanX_all(range) = meanX;
    meanY_all(range) = meanY;
end


end

