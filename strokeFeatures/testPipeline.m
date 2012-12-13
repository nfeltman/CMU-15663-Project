function testPipeline( prefix, sigma, nu, spacing, scale )
[starts, ends, im ] = getAllSegments(prefix);
[locs, deltas, w] = getControlPoints(starts, ends,3);
dx = deltas(:,1); dy = deltas(:,2);
[dx, dy] = doubleWrap(dx,dy);
M = rasterizeSamples([size(im,1) size(im,2)],locs,[dx dy],w);
[X, Y] = blurAndHomogenize( M, sigma, nu );
[X, Y] = unwrapSlope(X,Y);
gcf;
hold on;
%imshow(im); 
plot([starts(:,1) ends(:,1)]', [starts(:,2) ends(:,2)]','-k','LineWidth',1.5);
%scatter(locs(:,1),locs(:,2),'.g');
plotFlow(X,Y,spacing,scale); 
axis('equal')
set(gca,'xtick',[],'ytick',[],'YDir','reverse')
hold off;
end

