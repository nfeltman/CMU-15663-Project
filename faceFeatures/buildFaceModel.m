function [ model, hires ] = buildFaceModel( features, ids )
%BUILDFACEMODEL Summary of this function goes here
%   Detailed explanation goes here

model = cell(size(features,1),1);
for k = 1:size(features,1)
    allFeatures = features{k};
    [~,strokes] = getPositionsAdjusted(ids(k,:));
    strokes = filterDuplicatePoints(strokes);
    strokes = translateAndScaleFaceStrokes(allFeatures,strokes,40);
    if numel(allFeatures) == 0 || numel(strokes) == 0,
        model{k} = [];
    else
        % features
        strokes = cellmap(@(seg) splitLongSegs(seg,1),strokes);
        segF = cell2mat(cellmap(@(s)[getSegDeltas(s), getSegCenters(s)],strokes));
        [X,Y] = createUnwrappedSlopeField(segF(:,3:4), segF(:,1:2), [40 40], 0.1, 'lsq', 1);
        D = createDensityField(segF(:,3:4), segF(:,1:2), [40 40], 0.5);
        
        if sum(D(1:end)) > 30,
            strokes = cellmap(@(seg) splitLongSegs(seg*5,1),strokes);
            segF = cell2mat(cellmap(@(s)[getSegDeltas(s), getSegCenters(s)],strokes));
            hires = createDensityField(segF(:,3:4), segF(:,1:2), [200 200], 0.5);
            model{k} = [X(1:end),Y(1:end),D(1:end), hires(1:end)];
            %pause
        else
            model{k} = [];
        end
    end
end

model = vertCatCells(model);
hires = model(:,4801:end);
model = model(:,1:4800);

end

