function [ strokes ] = filterDuplicatePoints( strokes )
% Removes duplicate points, and filters strokes with only one point.

numStrokes = length(strokes);
strokeValid = true(numStrokes,1);
for k = 1:numStrokes,
    points = strokes{k};
    
    if size(points,2) == 1,
        % if there's only one point in the stroke, filter it
        strokeValid = false;
    else
        % check for duplicates
        duplicates = all(points(1:end-1,:) == points(2:end,:),2);
        points = points(~duplicates,:);
        strokes{k} = points;

        if size(points,2) == 0, 
            % if there's only one point after duplicate-removal, filter it
            strokeValid = false; 
        end
    end
end

strokes = strokes(strokeValid);

end

