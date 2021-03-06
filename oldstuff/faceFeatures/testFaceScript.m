if ( ~exist('strokeCell','var') )
    strokeCell = runOnValidEntries(@getData);
    strokeCell(cellfun(@isempty,strokeCell)) = [];
end

if ( ~exist('strokeTypeCell','var'))
   objectID = cell2mat(cellfun(@(x) x{2}, strokeCell,'UniformOutput', false));
   [strokeTypeCell, featureCell] = classifyAllStrokes(objectID); 
end

resizeStrokes = resizeAllStrokes(strokeCell, featureCell, 15);

for drawingIndex = 1:10
    figure();
    hold on
    drawImageStrokes(resizeStrokes{drawingIndex}, strokeTypeCell{drawingIndex}, 'yellow');
    hold off
end

%for drawingIndex = 1:10 
%    figure();
%    imshow(zeros(460,320));
%    hold on
%    drawImageStrokes(strokeCell{drawingIndex}{1}, strokeTypeCell{drawingIndex}, 'face');
%    hold off
%end