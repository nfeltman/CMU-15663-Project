function [ tree ] = createTreeFromArray( features, minLeafs )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    feature_y = int2str(features(:,11));
%    tree = ClassificationTree.fit(features(:,1:10), feature_y,'crossval','on');

    if minLeafs == 0 
      tree = classregtree(features(:,1:10), feature_y);
    else
        tree = classregtree(features(:,1:10), feature_y, 'minleaf',minLeafs);
    end
end

