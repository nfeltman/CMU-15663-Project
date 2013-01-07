
B = getPositions(drawAFriendFileName('qUeZYAL0IZ','S'));
B = filterDuplicatePoints(B);
B = cellmap(@(s)splitLongSegs(s,2),B);

targets = ['4R56rYWZfQ';'9ggZFhGnnO';'E5znYs8nrI';'dpzhjaPg5T'; ...
    'EaevUQv9A7';'Hss07oWTUY';'mobldcT3bY';'9zkRrokirT';'Syt9xsCCzO'; ...
    'u1uPtY8qjV';'yOijC9dBmf';'Zety8LiUdt'];

n = size(targets,1);
C = B;
% allDeltas = cellmap(@(s)zeros(size(s,1),n*2),C);
% for k = 1:n,
%     k
%     A = getPositions(drawAFriendFileName(targets(k,:),'S'));
%     A = filterDuplicatePoints(A);
%     A = cellmap(@(s)splitLongSegs(s,0.2),A);
%     A = vertCatCells(A);
%     allDeltas = cellmap(@(c,d) asgncol(d,[k, k+n],getNearestDeltaSample(c,A)),C,allDeltas);
% end
% allDeltas = vertCatCells(allDeltas);

ind = randperm(size(allDeltas,1),5);
locs = vertCatCells(C);

[dirs, score] = findOptimumCone(allDeltas(:,1:n),allDeltas(:,n+1:end));

% delta = cellmap(@mergeDeltas,deltaSum);
% C = cellmap(@(s,t) s+t,C,deltaSum);


figure(1);
gscatter(mtov(allDeltas(ind,1:n)'),mtov(allDeltas(ind,n+1:end)'),kron((1:5)',ones(n,1)),'rgbmc','.....');
axis('equal');
dirs(ind,:)
score(ind,:)

segsB = extractSegs(B);
% segsC = extractSegs(C);
figure(2);
plot([segsB(:,1) segsB(:,3)]',[segsB(:,2) segsB(:,4)]','r');hold on;
gscatter(locs(ind,1),locs(ind,2),1:5,'rgbmc','.....');
fixAxes(); hold off;
figure(3);
scatter(locs(:,1),locs(:,2),[],score,'.');
fixAxes(); hold off;