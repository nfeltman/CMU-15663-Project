function [ kMeansFeatures ] = clusterCell( cell )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    cell = resizeImageCell(cell);
    blurredCell = blurImageCells(cell, 8);
    kMeansFeatures = createKMeansFeatureFromCell(blurredCell);
    
end

function [ blurredCell ] = blurImageCells( cell, squareSize )
    blurredCell = cell(size(cell));
    scale = (squareSize*2) / (sum(size(cell{1})));
    
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


