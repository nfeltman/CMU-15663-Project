function [ clusters, averageClusterFeatures ] = clusterObjects( clusterFeatures, objectIDs, numberOfClusters )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    clusters = kmeans(clusterFeatures,numberOfClusters, 'emptyaction', 'singleton');
    averageClusterFeatures = zeros(numberOfClusters, size(clusterFeatures, 2));
    
    for clusterIndex = 1:numberOfClusters
       singleCluster = clusterFeatures(clusters == clusterIndex, :);
       averageClusterFeatures(clusterIndex, :) = sum(singleCluster)/size(singleCluster,1);
       row = ceil(sqrt(numberOfClusters));
       subplot(row, row, clusterIndex);
       bar(averageClusterFeatures(clusterIndex,:));
    end
    
    figure();
    for clusterIndex = 1:numberOfClusters
        size(objectIDs)
        size(clusters == clusterIndex)
        size(clusterFeatures)
        
       singleCluster = objectIDs(clusters == clusterIndex, :);
       numberOfDrawing = 5;
       for drawingIndex = 1:min(numberOfDrawing, size(singleCluster,1));
          subplot(numberOfClusters,5, numberOfDrawing*(clusterIndex - 1) + drawingIndex);
          drawImageWithPrefix(singleCluster(drawingIndex,:));
       end
    end
end

