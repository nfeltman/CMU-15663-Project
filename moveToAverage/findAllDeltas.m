function [ X, Y ] = findAllDeltas( sampleLocations, targets)

n = size(targets,1);
allDeltas = zeros(size(sampleLocations,1),n*2);
for k = 1:n,
    fprintf('On image %i of %i\n', k, n);
    A = getPositions(drawAFriendFileName(targets(k,:),'S'));
    A = filterDuplicatePoints(A);
    A = cellmap(@(s)splitLongSegs(s,0.2),A);
    A = vertcatcells(A);
    allDeltas(:,[k, k+n]) = getNearestDeltaSample(sampleLocations,A);
end

X = allDeltas(:,1:n);
Y = allDeltas(:,n+1:end);

end

