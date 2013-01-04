function [ X, Y ] = createUnwrappedSlopeField( segs, imsize, nu, algo, sigmaOrLambda )

centers = [segs(:,1)+segs(:,3), segs(:,2)+segs(:,4)]/2;
[dx, dy, w] = normalizeDeltas(segs(:,3)-segs(:,1), segs(:,4)-segs(:,2));
[dx, dy] = doubleWrap(dx,dy);
M = rasterizeSamples(imsize,centers,[dx.*w, dy.*w,w]);

if strcmp(algo,'blur'),
    M = blurAll(M, sigmaOrLambda);
    M = homogenize(M, nu);
elseif strcmp(algo,'lsq'),
    W = M(:,:,end);
    M = homogenize(M, 0.0001);
    M = lsqSolveAll(M, sigmaOrLambda*W+nu);
else
    error('Unrecognized algorithm.  Use either "blur" or "lsq".');
end
X = M(:,:,1);
Y = M(:,:,2);

end

