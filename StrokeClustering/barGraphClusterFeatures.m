function [ ] = barGraphClusterFeatures( averageClusters )
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here
    numberOfPlots = size(averageClusters,1);
    row = ceil(sqrt(numberOfPlots));

    for clusterIndex = 1:size(averageClusters,1)
        subplot(row, row, clusterIndex);
        bar(averageClusters(clusterIndex,:));
    end

end

