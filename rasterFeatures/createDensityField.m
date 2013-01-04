function D = createDensityField( segs, imsize, sigma )

centers = [segs(:,1)+segs(:,3), segs(:,2)+segs(:,4)]/2;
lens = sqrt((segs(:,3)-segs(:,1)).^2 + (segs(:,4)-segs(:,2)).^2);
D = rasterizeSamples(imsize,centers,lens);
D = D./(D+0.5);
D = blurAll(D, sigma);
D = D./(D+1);

end