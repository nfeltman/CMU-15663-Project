function [ output_args ] = queryNearests( im, nearX, nearY )
%QUERYNEARESTS Summary of this function goes here
%   Detailed explanation goes here

figure(1);
hImage = imagesc(im);
set(hImage,'ButtonDownFcn', @(s,e) onButtonDown(nearX,nearY));
fixAxes();
colormap jet
end

function onButtonDown(X,Y)
    loc = get(gca,'CurrentPoint');
    loc = floor(loc(1,[1 2]));
    x = X(loc*[460;1],:);
    y = Y(loc*[460;1],:);
    
    l = sqrt(x.*x+y.*y);
    lmean = mean(l);
    lenStd = sqrt(mean((l-lmean).^2));
    valid = ((l-lmean)./lenStd < 2);
    
    figure(2);
    gscatter(x,y,(~valid)+1,'bg','..',5); hold on;
    gscatter([0 mean(x) mean(x(valid))],[0 mean(y) mean(y(valid))],[1 2 3],'rgb','xxx'); hold off;
    axis equal
    set(gca,'YDir','reverse');    
end