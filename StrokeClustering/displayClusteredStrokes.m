function [ output_args ] = displayClusteredStrokes( prefix )
%UNTITLED15 Summary of this function goes here
%   Detailed explanation goes here
    [averageCluster, cluster, strokes] = clusterStrokes(prefix);
    drawImageStrokes(strokes, cluster, 'cluster');
end

