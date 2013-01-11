

%targets = ['4R56rYWZfQ';'9ggZFhGnnO';'E5znYs8nrI';'dpzhjaPg5T'; 'qUeZYAL0IZ'; ...
  %  'EaevUQv9A7';'Hss07oWTUY';'mobldcT3bY';'9zkRrokirT';'Syt9xsCCzO'; ...
  %  'u1uPtY8qjV';'yOijC9dBmf';'Zety8LiUdt'];

targets = ['0RHlW7x4aM';
'1aFLDuO2Ce';
'1DkHXriZIC';
'1v1roYjz7F';
'1XyPtkJjQn';
'1YcAkmhHLf';
'4BCr0lJW4k';
'4FzlxK3vbb';
'4usQ92XqLh';
'6dczux3SV9';
'7EPmhiGXFW';
'8KO4cdgbXS'];

 [gridX,gridY] = meshgrid(1:320,1:460);
 grid = [mtov(gridX), mtov(gridY)];
 [X, Y] = findAllDeltas(grid, targets);
[avg, score] = findSmartAverage(X,Y);
magAvg = sqrt(sum(avg.*avg,2));

magIm = reshape(magAvg,460,320);
scoreIm = reshape(score,460,320);

figure(3);
imagesc(min(max(scoreIm*2-0.75,0),1));
%imagesc(scoreIm);
fixAxes();
colormap jet