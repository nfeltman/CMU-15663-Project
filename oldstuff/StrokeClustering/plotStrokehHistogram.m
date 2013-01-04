function [ output_args ] = plotStrokehHistogram( prefix, row )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    strokeFile = drawAFriendFileName(prefix, 'S');
    [X, Y] = getPositions(strokeFile);
    strokeLengths = cellfun(@cellDistance, X,Y);
    strokeLengths(strokeLengths > 1000) = [];
    subplot(10,2, (row-1) * 2 + 1);
    [n,x] = hist(strokeLengths, 50:50:1000);
    bar(x,n./sum(n),.25,'hist');
    subplot(10,2,(row-1) * 2 + 2);
    drawImageWithPrefix(prefix);
end

