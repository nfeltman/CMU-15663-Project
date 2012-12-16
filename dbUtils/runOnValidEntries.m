function output = runOnValidEntries( f )
%RUNONVALIDIMAGES Runs a function on all valid images in the database.
%   
%   runOnValidEntries( f, dbFile )
%       Runs the function f on every valid image in the database file
%       identified by dbFile.  The results of f, for every image, are
%       returned as a cell array.
    dbFile = 'DrawAFriend_Rounds.txt';
    [ objectIDs, drawerID, guesserID, modelID, newset, accuracy ] = drawAFriendMetaData( dbFile );
disp(dbFile)
    
    for objectIDIndex = 1:size(objectIDs,1)
        objectID = objectIDs(objectIDIndex, :);
        [strokes, im ] = getInBoundStrokes(objectID);
        strokes = filterDuplicatePoints(strokes);
        strokes = cellmap(@(s)splitLongSegs(s,1), strokes);
        strokes(cellfun(@isempty,strokes)) = [];
    
        if ( size(im,1) ~= 0 )
            im_resize = aspectRatio(im, 320, 460);
        else
            im_resize = [];
        end

        f(strokes, im_resize);
    end
end

