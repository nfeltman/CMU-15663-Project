
B = getPositions(drawAFriendFileName('qUeZYAL0IZ','S'));
B = filterDuplicatePoints(B);
B = cellmap(@(s)splitLongSegs(s,2),B);

targets = ['4R56rYWZfQ';'9ggZFhGnnO';'E5znYs8nrI';'dpzhjaPg5T'; ...
    'EaevUQv9A7';'Hss07oWTUY';'mobldcT3bY';'9zkRrokirT';'Syt9xsCCzO'; ...
    'u1uPtY8qjV';'yOijC9dBmf';'Zety8LiUdt'];

n = size(targets,1);
% allDeltas = cellmap(@(s)zeros(size(s,1),n*2),B);
% for k = 1:n,
%     k
%     A = getPositions(drawAFriendFileName(targets(k,:),'S'));
%     A = filterDuplicatePoints(A);
%     A = cellmap(@(s)splitLongSegs(s,0.2),A);
%     A = vertcatcells(A);
%     allDeltas = cellmap(@(b,d) asgncol(d,[k, k+n],getNearestDeltaSample(b,A)),B,allDeltas);
% end
% [allDeltas, h] = vertcatcells(allDeltas);

ind = randperm(size(allDeltas,1),5);
locs = vertcatcells(B);

[avg, smartAvg, score] = findSmartAverage(allDeltas(:,1:n),allDeltas(:,n+1:end));

dumbCorrected = unvertcat(avg+locs,h);
corrected = cellmap(@(b,m) lsqStrokes(m,diff1(b),4), B, dumbCorrected);
% smartCorrected = locs + smartAvg;

figure(1);
gscatter(mtov(allDeltas(ind,1:n)'),mtov(allDeltas(ind,n+1:end)'),kron((1:5)',ones(n,1)),'rgbmc','.....');hold on;
gscatter(avg(ind,1),avg(ind,2),1:5,'rgbmc','ooooo');
gscatter(smartAvg(ind,1),smartAvg(ind,2),1:5,'rgbmc','*****');hold off;
axis('equal');

segsB = extractSegs(B);
segsC = extractSegs(corrected);
segsD = extractSegs(dumbCorrected);
% segsD = extractSegs(unvertcat(smartCorrected,h));
figure(2);
plot([segsB(:,1) segsB(:,3)]',[segsB(:,2) segsB(:,4)]','g');hold on;
plot([segsC(:,1) segsC(:,3)]',[segsC(:,2) segsC(:,4)]','r');
plot([segsD(:,1) segsD(:,3)]',[segsD(:,2) segsD(:,4)]','b');
gscatter(locs(ind,1),locs(ind,2),1:5,'rgbmc','.....');
fixAxes(); hold off;
figure(3);
scatter(locs(:,1),locs(:,2),[],score,'.');
fixAxes(); hold off;