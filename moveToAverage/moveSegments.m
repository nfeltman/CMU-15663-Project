function [ deltas ] = moveSegments( allSegs, target )

[minLen2,minIndex] = min(dist2(allSegs,target),[],2);
reversed = [target(:,3:4), target(:,1:2)];
[minLen2_r,minIndex_r] = min(dist2(allSegs,reversed),[],2);

bestIndex = minIndex;
revBetter = minLen2_r < minLen2;
bestIndex(revBetter) = minIndex_r(revBetter);

deltas = target(bestIndex,:) - allSegs;
reverseDeltas = reversed(bestIndex,:) - allSegs;
deltas(revBetter,:) = reverseDeltas(revBetter,:);

end

