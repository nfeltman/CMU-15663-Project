function [ M ] = rasterizeSamples( siz, locs, deltas, w)

X = zeros(siz);
Y = zeros(siz);
W = zeros(siz);

locs = ceil(locs);
i = (locs(:,1)-1) * siz(1) + locs(:,2);
dx = deltas(:,1).*w;
dy = deltas(:,2).*w;

for k = 1:size(locs,1),
    X(locs(k,2),locs(k,1)) = X(locs(k,2),locs(k,1)) + dx(k);
    Y(locs(k,2),locs(k,1)) = Y(locs(k,2),locs(k,1)) + dy(k);
    W(locs(k,2),locs(k,1)) = W(locs(k,2),locs(k,1)) + w(k);
end

M = cat(3,X,Y,W);
end

