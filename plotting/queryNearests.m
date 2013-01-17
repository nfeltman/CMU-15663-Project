function [ output_args ] = queryNearests( im, nearX, nearY )
%QUERYNEARESTS Summary of this function goes here
%   Detailed explanation goes here

p = [103 267; 158 210; 197 234; 194 80; 229   295];

figure(1);
hImage = imagesc(im);
set(hImage,'ButtonDownFcn', @(s,e) onButtonDown(nearX,nearY));
hold on;
scatter(p(:,1),p(:,2),200,'.w');
scatter(p(:,1),p(:,2),100,'.k');
hold off;
fixAxes();
colormap jet
end

function onButtonDown(X,Y)
    loc = get(gca,'CurrentPoint');
    loc = floor(loc(1,[1 2]));
    loc
    x = X(loc*[460;1],:);
    y = Y(loc*[460;1],:);
    
    len = sqrt(x.*x+y.*y);
    weight = exp(-len.*len/(mean(len).^2)/2);
    
    [ meanX, meanY, majorVar, minorVar, axisX, axisY ] = learnWeighting(x,y,weight);
    majorStd = sqrt(majorVar);
    minorStd = sqrt(minorVar);
    len = sqrt(meanX*meanX+meanY*meanY);
    
    figure(2);
    scatter(x,y,196,'b.'); hold on;
    gscatter([0 meanX],[0 meanY],[1 2],'kr','..',[20 10]);
    
    %plot([0, 0; u(1)*l, -u(2)*s],[0, 0; u(2)*l, u(1)*s],'c'); 
    plotEllipse([meanX;meanY],majorStd*[meanX; meanY]/len,minorStd*[meanY; -meanX]/len,'r','LineWidth', 3);
    plotEllipse([meanX;meanY],2*majorStd*[meanX; meanY]/len,2*minorStd*[meanY; -meanX]/len,'r','LineWidth',3);
    plotEllipse([meanX;meanY],3*majorStd*[meanX; meanY]/len,3*minorStd*[meanY; -meanX]/len,'r','LineWidth',3);
    % plot([0, 0; axisX*majorStd, -axisY*minorStd]+meanX,[0, 0; axisY*majorStd, axisX*minorStd]+meanY,'r'); 
    hold off;
    legend off;
    grid on;
    set(gca,'FontName','Times New Roman');
    set(gca,'FontSize',20);
    
    axis square
    axis equal
    set(gca,'YDir','reverse');
end