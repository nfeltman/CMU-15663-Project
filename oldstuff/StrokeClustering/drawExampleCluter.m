function [  ] = drawExampleCluter( clusters, objectIDs, clusterID, figureCount)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
    singleCluster = objectIDs(clusters == clusterID,:);
    
    for figureIndex = 1:min(figureCount, size(singleCluster,1))
       handle = figure();
       objectID = singleCluster(figureIndex,:);
       disp(objectID);
       drawImageWithPrefix(objectID);
       saveas( handle,['cluster_', int2str(clusterID), '_', int2str(figureIndex), '.jpg'], 'jpg');
    end
end

