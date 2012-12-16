function [ strokes, im ] = getInBoundStrokes( prefix )
% [ strokes, im ] = getInBoundStrokes( prefix )
% Gets the strokes which are within the image bounds.

[im,strokes] = getPositionsAdjusted(prefix);
strokeValid = true(size(strokes,1),1);

imageDoesntExist = size(im,1) == 0;
for k = 1:size(strokes,1),
    X = strokes{k}(:,1);
    Y = strokes{k}(:,2);
    inBounds = X > 0 & X <= size(im,2) & Y > 0 & Y <= size(im,1);
    
    % mark the stroke invalid if it has no segments
    if ~all(inBounds) && ~imageDoesntExist
        strokeValid(k,1) = false; 
    end
    
    strokes{k} = [X, Y];
end

strokes = strokes(strokeValid);

end

