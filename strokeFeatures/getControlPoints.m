function [ locs,deltas,w ] = getControlPoints( starts, ends, maxLen )

lens = sqrt((starts - ends).^2 * [1;1]);

nonTrivial = lens ~= 0;
starts = starts(nonTrivial,:);
ends = ends(nonTrivial,:);
lens = lens(nonTrivial);
deltas = (ends - starts)./(lens*[1 1]);

% c = the count of child subsegments
% a = the index of the subsegment within the segment
% b = the index of the parent segment
c = ceil(lens./maxLen);
ind = cumsum(c(1:end-1)) + 1;
a = zeros(sum(c),1);
a(ind) = c(1:end-1);
a = cumsum(1-a);
b = zeros(sum(c),1);
b(ind) = 1;
b = cumsum(b)+1;

p = (a-0.5)./c(b);
starts = starts(b,:);
ends = ends(b,:);

locs = (ends-starts).*(p*[1 1])+starts;
deltas = deltas(b,:);

w = lens./c;
w = w(b);

end

