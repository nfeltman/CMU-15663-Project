function [ starts, ends, im ] = getAllSegments( prefix )

[im,X,Y] = getPositionsAdjusted(prefix);

numStrokes = size(X,1);

totalNumSegs = 0;
for k = 1:numStrokes,
    valid = X{k} > 0 & X{k} <= size(im,2) & Y{k} > 0 & Y{k} <= size(im,1);
    X{k} = X{k}(valid);
    Y{k} = Y{k}(valid);
    totalNumSegs = totalNumSegs + size(X{k},1) - 1;
end

starts = zeros(totalNumSegs,2);
ends = zeros(totalNumSegs,2);

segsProcessed = 0;
for k = 1:numStrokes,
    segs = [X{k} Y{k}];
    n = size(segs,1)-1;
    starts(segsProcessed + (1:n), :) = segs(1:end-1,:);
    ends(segsProcessed + (1:n), :) = segs(2:end,:);
    segsProcessed = segsProcessed + n;
end
end

