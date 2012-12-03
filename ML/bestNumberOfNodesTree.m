function [ err ] = bestNumberOfNodesTree( features )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    start = 'start'
    feature_y = int2str(features(:,11));
%    tree = ClassificationTree.fit(features(:,1:10), feature_y,'crossval','on');
  %  tree = classregtree(features(:,1:10), feature_y, 'crossval', 'on');
    
    leafs = logspace(1,4,20);

    N = numel(leafs);
    err = zeros(N,1);
    max_err = 1000000;
    
    for n=1:N
        leafs(n)
        t = ClassificationTree.fit(features(:,1:10), feature_y,'crossval','on', 'prune', 'off', 'minleaf',leafs(n));
        err(n) = kfoldLoss(t)
        if max_err > err(n)
           max_err = err(n) 
           tree = t;
        end
    end
    
    plot(leafs,err);
    xlabel('Min Leaf Size');
    ylabel('cross-validated error');
end

