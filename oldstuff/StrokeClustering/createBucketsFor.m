function [ bucketCount, bucket ] = createBucketsFor( prefix )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    strokeFile = drawAFriendFileName(prefix, 'S');
    [X, Y] = getPositions(strokeFile);
    if ( size(X,1) == 0 )
       bucketCount = [];
       bucket = [];
       return;
    end
    
    strokeLengths = cellfun(@cellDistance, X,Y);
    strokeLengths(strokeLengths > 2000) = [];
    [bucketCount,bucket] = hist(strokeLengths, 50:50:2000);
end

