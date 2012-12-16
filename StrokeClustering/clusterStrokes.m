function [ averageCluster, clusters  ] = clusterStrokes( prefix )
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
    disp(prefix);
    [strokes, im ] = getInBoundStrokes(prefix);
    strokes = filterDuplicatePoints(strokes);
    strokes = cellmap(@(s)splitLongSegs(s,1), strokes);

    

    strokeOrrientations =  cellmap(@strokeOrrientation, strokes);
    strokeOrrientations = cell2mat(strokeOrrientations);
    numberOfClusters = round(size(strokes,1)/10);
    clusters = kmeans(strokeOrrientations, numberOfClusters);
    averageCluster = getAverageFeatures(strokeOrrientations, clusters);



end

