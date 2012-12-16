function D = createDensityField( centers, deltas, imsize, sigma )

lens = sqrt(sum(deltas.^2,2));
D = rasterizeSamples(imsize,centers,lens);
D = blurAll(D, sigma);

end