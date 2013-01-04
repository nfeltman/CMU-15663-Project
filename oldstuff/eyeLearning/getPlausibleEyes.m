function patchList = getPlausibleEyes( strokes, image )

if numel(image) == 0 || numel(strokes) == 0,
    patchList = cell(0,2);
    return;
end

imsize = size(image);

features = vertCatCells(cellmap(@(s)[getSegCenters(s), getSegDeltas(s)] , strokes));

[dx, dy, w] = normalizeDeltas(features(:,3), features(:,4));
[dx, dy] = doubleWrap(dx,dy);
M = rasterizeSamples(imsize,features(:,1:2),[dx.*w, dy.*w,w]);

W = M(:,:,end);
M = homogenize(M, 0.0001);
M = lsqSolveAll(M, 2*W+0.05);

patches = 0;

% incomplete

end

