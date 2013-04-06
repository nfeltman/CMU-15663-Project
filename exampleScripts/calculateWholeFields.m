
[gridX,gridY] = meshgrid(1:320,1:460);
grid = [mtov(gridX), mtov(gridY)];
[X, Y] = findAllDeltas(grid, prefixesBO,0.4);
[avg, score] = findSmartAverage(X,Y);

magAvg = sqrt(sum(avg.*avg,2));
direction = atan2(avg(:,2),avg(:,1));

magIm = reshape(magAvg,460,320);
dirIm = reshape(direction,460,320);
scoreIm = reshape(score,460,320);

figure(1);
imagesc(log(magIm+0.1)); hold on
fixAxes();
colormap jet

figure(2);
imagesc(log(magIm+0.1)); hold on
fixAxes();

ys = 2:15:460;
xs = 2:15:320;
u = cos(dirIm(ys,xs))*10;
v = sin(dirIm(ys,xs))*10;
h = quiver(gridX(ys,xs)-u/2,gridY(ys,xs)-v/2,u,v,'r','AutoScale','off');
adjust_quiver_arrowhead_size(h,1.5);

hold off
b = gray;
colormap(b/3+0.6666);