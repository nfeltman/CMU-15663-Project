
B = getPositions(drawAFriendFileName('0RHlW7x4aM','S'));
B = filterDuplicatePoints(B);
B = cellmap(@(s)splitLongSegs(s,1),B);
B = extractSegs(B);
C = B;

targets = [%'0RHlW7x4aM';
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

for iters = 1:10
    iters
    deltaSum = 0;
    for k = 1:size(targets,1),
        A = getPositions(drawAFriendFileName(targets(k,:),'S'));
        A = filterDuplicatePoints(A);
        A = cellmap(@(s)splitLongSegs(s,1),A);
        A = extractSegs(A);
        d = moveSegments(C,A);
        dnorm = sqrt(sum(abs(d).^2,2));
        modulation = max(1-dnorm/10,0);

        deltaSum = deltaSum + diag(modulation)*d;
    end
    deltaSum = deltaSum / size(targets,1);

    C = deltaSum+C;
end

figure();hold on;
plot([B(:,1) B(:,3)]',[B(:,2) B(:,4)]','r');
plot([C(:,1) C(:,3)]',[C(:,2) C(:,4)]','b');
fixAxes(); hold off;