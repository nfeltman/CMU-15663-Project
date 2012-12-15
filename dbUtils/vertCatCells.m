function [ allSegs ] = vertCatCells( strokes )
% Vertically concatinate all of the matrices in the argument cell array.

numStrokes = size(strokes,1);

% if there are no strokes, there's nothing to merge
if numStrokes == 0,
    allSegs = [];
    return;
end


totalNumSegs = 0;
for k = 1:numStrokes,
    totalNumSegs = totalNumSegs + size(strokes{k},1) - 1;
end

allSegs = zeros(totalNumSegs,size(strokes{1},2));

segsProcessed = 0;
for k = 1:numStrokes,
    segs = strokes{k};
    n = size(segs,1);
    allSegs(segsProcessed + (1:n), :) = segs;
    segsProcessed = segsProcessed + n;
end

end
