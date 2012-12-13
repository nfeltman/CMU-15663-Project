function [F] = getDotProductFeatures(prefix)

    [starts, ends, im ] = getAllSegments(prefix);
    [locs, deltas, w] = getControlPoints(starts, ends,3);
    dx = deltas(:,1); dy = deltas(:,2);
    [dx, dy] = doubleWrap(dx,dy);
    M = rasterizeSamples([size(im,1) size(im,2)],locs,[dx dy],w);
    
    im = rgb2gray(im2double(im));
    im = im - mean(im(1:end));
    im = im / std(im(1:end));
    
    getDotProductFeature(M,im,3,4);
end

function [F] = getDotProductFeature(M, im, sigma1, sigma2)
    [dX, dY] = blurAndHomogenize( M, sigma1, 0.05 );
    [dX, dY] = unwrapSlope(dX,dY);
    
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
