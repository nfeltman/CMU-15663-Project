function [ X, Y ] = createSlopeField( centers, deltas, imsize, nu, algo, sigmaOrLambda )

[X,Y] = createUnwrappedSlopeField( centers, deltas, imsize, nu, algo, sigmaOrLambda );
[X,Y] = unwrapSlope(X,Y);

end

