

targets = ['4R56rYWZfQ';'9ggZFhGnnO';'E5znYs8nrI';'dpzhjaPg5T'; 'qUeZYAL0IZ'; ...
    'EaevUQv9A7';'Hss07oWTUY';'mobldcT3bY';'9zkRrokirT';'Syt9xsCCzO'; ...
    'u1uPtY8qjV';'yOijC9dBmf';'Zety8LiUdt'];

% [gridX,gridY] = meshgrid(1:320,1:460);
% grid = [mtov(gridX), mtov(gridY)];
% [X, Y] = findAllDeltas(grid, targets);
[avg, smartAvg, score] = findSmartAverage(X,Y);
magAvg = sqrt(sum(avg.*avg,2));

magIm = reshape(magAvg,460,320);
scoreIm = reshape(score,460,320);

figure(3);
imagesc(scoreIm);
fixAxes();
colormap jet