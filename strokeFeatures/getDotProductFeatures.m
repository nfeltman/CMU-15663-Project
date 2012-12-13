function [F] = getDotProductFeatures(prefix)

    [strokes, im ] = getInBoundStrokes(prefix);
    imsize = [size(im,1) size(im,2)];
    strokes = filterDuplicatePoints(strokes);
    strokes = cellmap(@(s)splitLongSegs(s,1), strokes);
    segFeatures = vertCatCells(cellmap(@getFeatures, strokes));

    % create the unwrapped slope field
    [X,Y] = createSlopeField(segFeatures(:,3:4), segFeatures(:,1:2), imsize, 0.05, 'lsq', 2);
    
    im = rgb2gray(im2double(im));
    im = im - mean(im(1:end));
    im = im / std(im(1:end));
    
    getDotProductFeature(X,Y,im,2);
end

function [F] = getDotProductFeature(dX, dY, im, sigma2)
    
    g = fspecial('gaussian',ceil(sigma2*2.5)*2+1,sigma2);
    blurred = conv2(im,g,'same');
    gradX = conv2(blurred,[-1 1],'same');
    gradY = conv2(blurred,[-1; 1],'same');
    mag = sqrt(gradX.^2 + gradY.^2);
    mag = mag + mean(mag(1:end))*0.5;
    gradX = gradX./mag;
    gradY = gradY./mag;
    
    perpendicularity = abs(gradX.*dY - gradY.*dX);
    parallelness = abs(gradX.*dX + gradY.*dY);
    %plotFlow(gradX,gradY,2,1.8);
    imagesc(perpendicularity);
end

function f = getFeatures(s)
    centers = getSegCenters(s);
    deltas = getSegDeltas(s);
    f = [ deltas, centers, centers-deltas/2, centers+deltas/2];
end