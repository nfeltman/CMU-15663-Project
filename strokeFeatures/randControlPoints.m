function [ locs,deltas,w ] = randControlPoints( n,wid,hei )

locs = ceil(rand(n,2) * diag([wid, hei]));
w = ones(n,1);

dir = rand(n,1)*(2*pi);
deltas = [cos(dir), sin(dir)];

end

