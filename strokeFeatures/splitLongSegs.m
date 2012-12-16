function [ morePoints ] = splitLongSegs( points, maxLen )
if ( size(points,1) == 0 )
    morePoints = [];
    return;
end

deltas = getSegDeltas(points);
lens = sqrt(deltas.^2 * [1;1]);

% c = the count of child subsegments
% a = the index of the subsegment within the segment
% b = the index of the parent segment
c = ceil(lens./maxLen);
n = sum(c);
ind = cumsum(c(1:end-1)) + 1;
a = zeros(n,1);
a(ind) = c(1:end-1);
a = cumsum(1-a);
b = zeros(n,1);
b(ind) = 1;
b = cumsum(b)+1;

p = (a-1)./c(b);

morePoints = zeros(n+1,2);
morePoints(1:n,:) = deltas(b,:).*(p*[1 1])+points(b,:);
morePoints(end,:) = points(end,:);

end

