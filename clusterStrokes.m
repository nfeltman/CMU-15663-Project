function [ averageCluster, clusters, strokes  ] = clusterStrokes( prefix )
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
    disp(prefix);
    [strokes, im ] = getInBoundStrokes(prefix);
    strokes = filterDuplicatePoints(strokes);
    strokes = cellmap(@(s)splitLongSegs(s,1), strokes);
    
    if ( size(strokes,1) == 0 && size(strokes,2) ~= 2)
        averageCluster = [];
        clusters = [];
        strokes = [];
        return;
    end

    strokes(cellfun(@isempty,strokes)) = [];
    

    strokeOrrientations =  cellmap(@strokeOrrientation, strokes);
    strokeOrrientations = cell2mat(strokeOrrientations);
    numberOfClusters = round(size(strokes,1)/10);
    clusters = kmeans(strokeOrrientations, numberOfClusters, 'emptyaction', 'drop');
    averageCluster = getAverageFeatures(strokeOrrientations, clusters);
end

