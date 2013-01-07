function allSegs = extractSegs( strokes )
%EXTRACTSEGS Summary of this function goes here
%   Detailed explanation goes here

allSegs = vertcatcells(cellmap(@(s)[s(1:end-1,:) s(2:end,:)],strokes));

end

