function [ feature ] = getRoughFeatures( imSize, strokes )

strokes = cellmap(@(seg) splitLongSegs(seg,1),strokes);

% create segment features
segF = cell2mat(cellmap(@(s)[getSegDeltas(s), getSegCenters(s)],strokes));
[X,Y] = createUnwrappedSlopeField(segF(:,3:4), segF(:,1:2), imSize, 0.1, 'lsq', 3);
D = createDensityField(segF(:,3:4), segF(:,1:2), imSize, 3);

% this part is for testing purposes
[uX,uY] = unwrapSlope(X,Y);
figure(1); plotFlow(uX,uY,1,0.9); fixAxes;
figure(2); imagesc(D); fixAxes; colormap gray;

feature = [X(1:end), Y(1:end), D(1:end)];

end

