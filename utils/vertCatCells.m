function [ merged, h ] = vertcatcells( cellArray )
% Vertically concatinate all of the matrices in the argument cell array.

numStrokes = size(cellArray,1);

% if there are no strokes, there's nothing to merge
if numStrokes == 0,
    merged = [];
    return;
end


totalNumSegs = 0;
for k = 1:numStrokes,
    totalNumSegs = totalNumSegs + size(cellArray{k},1) - 1;
end

if isfloat(cellArray{1})
    merged = zeros(totalNumSegs,size(cellArray{1},2));
elseif iscell(cellArray{1})
    merged = cell(totalNumSegs,size(cellArray{1},2));
else
    error('Unrecognized class!');
end

h = zeros(numStrokes,1);
segsProcessed = 0;
for k = 1:numStrokes,
    segs = cellArray{k};
    n = size(segs,1);
    h(k) = n;
    if n > 0,
        merged(segsProcessed + (1:n), :) = segs;
        segsProcessed = segsProcessed + n;
    end
end

end

