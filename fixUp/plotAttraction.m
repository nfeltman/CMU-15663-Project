function  plotAttraction( prefix )
[startsOrig, endsOrig, im] = getAllSegments(prefix);

im2 = rgb2gray(im2double(im));
edges = double(edge(im2,'roberts', 0.06));

[dx, dy] = gradient(im2,2);
edges = log(sqrt(dy.^2+dx.^2)+1);
edges = edges/max(edges(1:end));

[aX,aY] = createAttractorKernels(10);

U = conv2(edges,aX*3,'same');
V = conv2(edges,aY*3,'same');

starts = startsOrig;
ends = endsOrig;

for k = 1:80,
startsT = takeStep(starts,U,V);
endsT = takeStep(ends,U,V);
starts = startsT;
ends = endsT;
end

imshow(edges); hold on;
plot([startsOrig(:,1) endsOrig(:,1)]', [startsOrig(:,2) endsOrig(:,2)]','.-r');
plot([starts(:,1) ends(:,1)]', [starts(:,2) ends(:,2)]','.-y');
%quiver(U,V,'r'); 
hold off; axis('equal');
set(gca,'xtick',[],'ytick',[],'YDir','reverse')

end

function M = takeStep(M,U,V)

stepX = interp2(U,M(:,1),M(:,2));
stepY = interp2(V,M(:,1),M(:,2));

M = M+[stepX, stepY];

end