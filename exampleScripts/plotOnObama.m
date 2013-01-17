obamaAvg = imread('C:\Users\Nicolas\Pictures\drawafriend\avg_bo.png');
neighborSources = [74 285; 152 126; 176 188; 292 228];

figure(1);
imshow(obamaAvg); hold on;
scatter(neighborSources(:,1),neighborSources(:,2),440,'b.');
scatter(neighborSources(:,1),neighborSources(:,2),25,'r.');
hold off;