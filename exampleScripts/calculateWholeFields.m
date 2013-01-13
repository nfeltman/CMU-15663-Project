
[gridX,gridY] = meshgrid(1:320,1:460);
grid = [mtov(gridX), mtov(gridY)];
[X, Y] = findAllDeltas(grid, prefixesKK,0.4);
[avg, score] = findSmartAverage(X,Y);
magAvg = sqrt(sum(avg.*avg,2));

magIm = reshape(magAvg,460,320);
scoreIm = reshape(score,460,320);

figure(1);
imagesc(log(magIm+0.1));
fixAxes();
colormap jet