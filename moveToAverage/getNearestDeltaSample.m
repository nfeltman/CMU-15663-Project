function [ deltas ] = getNearestDeltaSample(pts, target )

% pts and target are both a bunch of points


[~,minIndex] = min(dist2(pts,target),[],2);

deltas = target(minIndex,:) - pts;

end

