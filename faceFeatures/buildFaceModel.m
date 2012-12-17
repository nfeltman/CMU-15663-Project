function [ output_args ] = buildFaceModel( features, ids )
%BUILDFACEMODEL Summary of this function goes here
%   Detailed explanation goes here

model = cell(size(features,1),1);
for k = 1:size(features,1)
    allFeatures = features{k};
    [~,strokes] = getPositionsAdjusted(ids(k,:));
    strokes = filterDuplicatePoints(strokes);
    strokes = translateAndScaleFaceStrokes(allFeatures,strokes,100);
    if numel(allFeatures) == 0 || numel(strokes) == 0,
        model{k} = [];
    else
        k
        model{k} = getRoughFeatures([100 100],strokes);
        pause
    end
end

end

