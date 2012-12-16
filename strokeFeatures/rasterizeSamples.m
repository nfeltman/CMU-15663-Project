function [ M ] = rasterizeSamples( siz, locs, values)

locs = ceil(locs);

n = size(values,2);
M = zeros(siz(1), siz(2), n);

for k = 1:size(locs,1),
    x = locs(k,1);
    y = locs(k,2);
    if x >= 1 && x <= siz(2) && y >= 1 && y <= siz(1), 
        M(y,x,:) = M(y,x,:) + reshape(values(k,:),1,1,n);
    end
end

end

