function D = createDensityField( centers, deltas, imsize, sigma )

lens = sqrt(sum(deltas.^2,2));
D = rasterizeSamples(imsize,centers,lens);
D = D./(D+0.5);
D = blurAll(D, sigma);
D = D./(D+1);

end