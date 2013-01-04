
B = getPositions(drawAFriendFileName('9zkRrokirT','S'));
B = filterDuplicatePoints(B);
B = cellmap(@(s)splitLongSegs(s,1),B);
C = B;

targets = ['4R56rYWZfQ';'9ggZFhGnnO';'E5znYs8nrI';'dpzhjaPg5T'; ...
    'EaevUQv9A7';'Hss07oWTUY';'mobldcT3bY';'qUeZYAL0IZ';'Syt9xsCCzO'; ...
    'u1uPtY8qjV';'yOijC9dBmf';'Zety8LiUdt'];

for iters = 1:1
    deltaSum = [];
    for k = 1:size(targets,1),
        k
        A = getPositions(drawAFriendFileName(targets(k,:),'S'));
        A = filterDuplicatePoints(A);
        A = cellmap(@(s)splitLongSegs(s,1),A);
        A = vertCatCells(A);
        if numel(deltaSum) == 0, 
            deltaSum = cellmap(@(s) temperSampleDeltas(getNearestDeltaSample(s,A)),C);
        else
            deltaSum = cellmap(@(s,t) temperSampleDeltas(getNearestDeltaSample(s,A))+t,C,deltaSum);
        end
    end
    deltaSum = cellmap(@(s) s(:,1:2)./(s(:,3)*[1 1]+eps),deltaSum);
    C = cellmap(@(s,t) s+t,C,deltaSum);
end

segsB = extractSegs(B);
segsC = extractSegs(C);
figure();hold on;
plot([segsB(:,1) segsB(:,3)]',[segsB(:,2) segsB(:,4)]','r');
plot([segsC(:,1) segsC(:,3)]',[segsC(:,2) segsC(:,4)]','b');
fixAxes(); hold off;