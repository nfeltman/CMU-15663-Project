
B = getPositions(drawAFriendFileName('7EPmhiGXFW','S'));
B = filterDuplicatePoints(B);
B = cellmap(@(s)splitLongSegs(s,2),B);

% targets = ['4R56rYWZfQ';'9ggZFhGnnO';'E5znYs8nrI';'dpzhjaPg5T'; 'qUeZYAL0IZ'; ...
%     'EaevUQv9A7';'Hss07oWTUY';'mobldcT3bY';'9zkRrokirT';'Syt9xsCCzO'; ...
%     'u1uPtY8qjV';'yOijC9dBmf';'Zety8LiUdt'];

targets = ['0RHlW7x4aM';
'1aFLDuO2Ce';
'1DkHXriZIC';
'1v1roYjz7F';
'1XyPtkJjQn';
'1YcAkmhHLf';
'4BCr0lJW4k';
'4FzlxK3vbb';
'4usQ92XqLh';
'6dczux3SV9';
%'7EPmhiGXFW';
'8KO4cdgbXS'];
% 
% iterBunch = B;
% for iter = 1:10,
%     [allSamples, h] = vertcatcells(iterBunch);
%     [X, Y] = findAllDeltas(allSamples, targets);
%     [avg, score] = findSmartAverage(X,Y);
%     modulator = min(max(score*2-0.75,0),1);
%     dumbCorrected = unvertcat((modulator*[1 1]).*avg+allSamples,h);
%     corrected = cellmap(@(b,m) lsqStrokes(m,diff1(b),4), B, dumbCorrected);
%     iterBunch = corrected;
% end
% 
% segsB = extractSegs(B);
% segsC = extractSegs(corrected);
% segsD = extractSegs(dumbCorrected);
figure(2);
plot([segsB(:,1) segsB(:,3)]',[segsB(:,2) segsB(:,4)]','g');hold on;
plot([segsC(:,1) segsC(:,3)]',[segsC(:,2) segsC(:,4)]','r.');
%plot([segsD(:,1) segsD(:,3)]',[segsD(:,2) segsD(:,4)]','b');
fixAxes(); hold off;
figure(3);
scatter(allSamples(:,1),allSamples(:,2),[],score,'.');
fixAxes(); hold off;