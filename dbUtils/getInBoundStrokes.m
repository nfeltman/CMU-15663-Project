function [ strokes, im ] = getInBoundStrokes( prefix )
% [ strokes, im ] = getInBoundStrokes( prefix )
% Gets the strokes which are within the image bounds.

[im,X,Y] = getPositionsAdjusted(prefix);

strokes = cell(size(X));
strokeValid = true(size(X));
for k = 1:size(X,1),
    inBounds = X{k} > 0 & X{k} <= size(im,2) & Y{k} > 0 & Y{k} <= size(im,1);
    % mark the stroke invalid if it has no segments
    if ~all(inBounds), 
        strokeValid = false; 
    end
    
    strokes{k} = [X{k}, Y{k}];
end

strokes = strokes(strokeValid);

end

