function patches = getManyPatches( imW, imH, smallestW, smallestH, sizes)
%GETPATCHES Gets a tiling series of patches.
%   Detailed explanation goes here

numW = floor(imW/smallestW);
numH = floor(imH/smallestH);

coverageW = numW * smallestW;
coverageH = numH * smallestH;

shiftX = floor((imW-coverageW)/2)+1;
shiftY = floor((imH-coverageH)/2)+1;

c = cell(length(sizes),1);

for k = 1:length(sizes)
    v = sizes(k);
    startsX = (0:numW-v)*smallestW+shiftX;
    startsY = (0:numH-v)*smallestH+shiftY;
    [X,Y] = meshgrid(startsX,startsY);
    n = numel(X);
    c{k} = [X(1:n)', Y(1:n)', smallestW*v*ones(n,1), smallestH*v*ones(n,1)];
end

patches = vertCatCells(c);

end

