function [ newStrokes ] = translateAndScaleFaceStrokes( features, strokes, faceSize )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    if ( size(features,1) == 0 )
       features = {}; 
       newStrokes = {};
       return;
    end
    
    faceFeature = features{enumFeature('face')};
    if ( size(faceFeature,1) == 0 )
       newStrokes = {};
       return;
    elseif ( size(faceFeature,1) > 1 )
        faceFeature = faceFeature(1,:);
        warning('Ignoring extra faces because it is easier');
    end
    
    inStrokesBool = cellfun(@(x) classifyStrokeWithFeatureAndRectangle(x,faceFeature), strokes) > .5;
    inStrokes = strokes(inStrokesBool);
    newStrokes = adjustStrokesLocations(inStrokes, faceFeature(1,1), faceFeature(1,2),faceSize/faceFeature(1,3));
%    figure();
%    drawImageStrokes(inStrokesAdjusted, [], 'yellow');
end

