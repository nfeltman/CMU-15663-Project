function [ averageFeatures ] = getAverageFeatures( features, clusters )
%UNTITLED13 Summary of this function goes 
%   Detailed explanation goes here
    averageFeatures = zeros(max(clusters), size(features,2));
    
    for clusterIndex = 1:max(clusters)
        singleCluster = features(clusters==clusterIndex,:);
        averageFeatures(clusterIndex,:) = mean(singleCluster);
    end
end

