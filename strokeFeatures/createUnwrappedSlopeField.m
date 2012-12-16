function [ X, Y ] = createUnwrappedSlopeField( centers, deltas, imsize, nu, algo, sigmaOrLambda )

[dx, dy, w] = normalizeDeltas(deltas(:,1), deltas(:,2));
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

