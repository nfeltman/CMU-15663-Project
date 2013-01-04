function [ X,Y ] = createImageFlow( prefix )
sigma = 1;
nu = 0.05;

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[starts, ends, im ] = getAllSegments(prefix);
if ( size(starts,1) == 0 || size(ends,1) == 0 || size(im,1) == 0 )
   X = [];
   Y = [];
   return;
end
    
[locs, deltas, w] = getControlPoints(starts, ends,3);
dx = deltas(:,1); dy = deltas(:,2);
[dx, dy] = doubleWrap(dx,dy);
M = rasterizeSamples([size(im,1) size(im,2)],locs,[dx dy],w);
[X, Y] = blurAndHomogenize( M, sigma, nu );

end

