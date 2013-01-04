function [ resizedStrokes ] = resizeAllStrokes( strokeCell, featureCell, faceSize )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    resizedStrokes = cell(size(strokeCell,1), 1);
    for drawingIndex = 1:size(strokeCell,1)
         resizedStrokes{drawingIndex} = translateAndScaleFaceStrokes( featureCell{drawingIndex}, strokeCell{drawingIndex}{1}, faceSize );
    end
end

