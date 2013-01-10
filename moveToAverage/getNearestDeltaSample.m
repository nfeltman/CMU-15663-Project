function [ deltas ] = getNearestDeltaSample(pts, target )

% pts and target are both a bunch of points

% n = size(pts,1);
% chunks = ceil(n/1024);
% 
% deltas = zeros(size(pts,1),2);
% for k = 0:chunks-1,
%     fprintf('on chunk %i of %i \n',k+1,chunks)
%     range = k*1024+1:min((k+1)*1024,n);
%     [~,minIndex] = min(dist2(pts(range,:),target),[],2);
% 
%     deltas(range,:) = target(minIndex,:);
% end
% 
% deltas = deltas - pts;

target = unique(target,'rows');
T = delaunayn(target);
I = dsearchn(target, T, pts);
deltas = target(I,:) - pts;

end

