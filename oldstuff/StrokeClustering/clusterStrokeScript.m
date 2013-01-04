for objectIndex = 1:size(objectID,1)
    [averageCluster, cluster, strokes] = clusterStrokes(objectID(objectIndex,:));
    if ( size(strokes,1) > 0)
        figure();
        imshow(zeros(460,320));
        drawImageStrokes(strokes, cluster, 'cluster');
        input('tap to continue');
    end
    close all
end