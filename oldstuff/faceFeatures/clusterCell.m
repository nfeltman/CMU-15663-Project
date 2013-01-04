function [ clusters ] = clusterCell( cell, numberOfClusters )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    cell = resizeImageCell(cell);
    blurredCell = blurImageCells(cell, 8);
    %blurredCell = scaleImageCells(cell, .5);
    kMeansFeatures = createKMeansFeatureFromCell(blurredCell);
    
   % options = statset('CovType', 'diagonal');
   size(kMeansFeatures)
    clusters = gmdistribution.fit(kMeansFeatures,numberOfClusters,'CovType','diagonal');
    clusters = clusters.cluster(kMeansFeatures);
    
    %clusters = kmeans(kMeansFeatures,numberOfClusters);
    
end

function [ blurredCell ] = blurImageCells( cell, squareSize )
    blurredCell = cell(size(cell));
    scale = (squareSize*2) / (sum(size(cell{1})));
    
    blurredCell = scaleImageCells(cell, scale);
end

function [ blurredCell ] = scaleImageCells( cell, scale )
    for cellIndex = 1:size(cell,2)
       blurredCell{cellIndex} = normalizeSample(imresize(cell{cellIndex}, scale));
    end
end

function [kMeansFeatures] = createKMeansFeatureFromCell( cell )
    [width,height] = size(cell{1});
    kMeansFeatures = zeros(size(cell,1), width*height);
    for cellIndex = 1:size(cell,2)
        kMeansFeatures(cellIndex,:) = reshape(cell{cellIndex}, 1, []);
    end
end

function [z] = normalizeSample(z0)
    [m n] =size(z0);
    z1 =z0(:);
    z2 =(z1-mean(z1))/std(z1);
    z =reshape(z2,m,n);
end


