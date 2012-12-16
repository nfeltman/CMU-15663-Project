function testPipeline( prefix, nu, method, sigma, spacing, scale )
[strokes, im ] = getInBoundStrokes(prefix);
imsize = [size(im,1) size(im,2)];
strokes = filterDuplicatePoints(strokes);
strokes = cellmap(@(s)splitLongSegs(s,1), strokes);
segFeatures = vertCatCells(cellmap(@getFeatures, strokes));

if numel(im) == 0, error('image not found'); end

% create the unwrapped slope field
[X,Y] = createSlopeField(segFeatures(:,3:4), segFeatures(:,1:2), imsize, nu, method, sigma);

% show results
gcf;
hold on;
%imshow(im); 
plot(segFeatures(:,[5 7])', segFeatures(:,[6 8])', '.-k','LineWidth',1.5);
%scatter(locs(:,1),locs(:,2),'.g');
plotFlow(X,Y,spacing,scale);
fixAxes();
end

function f = getFeatures(s)
    centers = getSegCenters(s);
    deltas = getSegDeltas(s);
    f = [ deltas, centers, centers-deltas/2, centers+deltas/2];
end