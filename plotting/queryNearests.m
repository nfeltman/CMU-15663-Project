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
    
    len = sqrt(x.*x+y.*y);
    weight = exp(-len.*len/(mean(len).^2)/2);
    a = weightedAvg(x.*x,weight);
    b = weightedAvg(x.*y,weight);
    c = weightedAvg(y.*y,weight);
    [l2, s2, u ] = smallEigs(a,b,c);
    ux = u(:,1);
    uy = u(:,2);
    
    fancy_len = sqrt((x.*ux + y.*uy).^2./l2 + (x.*uy - y.*ux).^2./s2);
    [valid, cutoff] = filterOutliers(fancy_len,1);
    
    
    [ meanX, meanY, majorVar, minorVar, axisX, axisY ] = learnWeighting(x,y,weight);
    majorStd = sqrt(majorVar);
    minorStd = sqrt(minorVar);
    
    figure(2);
    gscatter(x,y,(~valid)+1,'bb','..',5); hold on;
    gscatter([0 mean(x) mean(x(valid)) meanX],[0 mean(y) mean(y(valid)) meanY],[1 2 3 4],'cgbr','xxxx');
    
    l = sqrt(l2);
    s = sqrt(s2);
    
    %plot([0, 0; u(1)*l, -u(2)*s],[0, 0; u(2)*l, u(1)*s],'c'); 
    plot([0, 0; axisX*majorStd, -axisY*minorStd]+meanX,[0, 0; axisY*majorStd, axisX*minorStd]+meanY,'r'); hold off;
    axis equal
    set(gca,'YDir','reverse');
    
    figure(3);
    s = sort(fancy_len);
    plot(s,'.-'); hold on;
    plot([0 length(s)],[cutoff(1) cutoff(1)],'g');
    plot([0 length(s)],[cutoff(2) cutoff(2)],'g'); hold off;
end