function [ newStroke ] = convulveStrokes( stroke, sizeOfWindow )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
disp('lol')
    size(stroke)
    paddingTop = ones(sizeOfWindow-1,1) * stroke(1,:);
    paddingBot = ones(sizeOfWindow-1,1) * stroke(end,:);
    stroke = [paddingTop; stroke; paddingBot];
    size(stroke)
    window = ones(sizeOfWindow,1)/sizeOfWindow;
    newStroke =  [conv(stroke(:,1), window,'valid'),conv(stroke(:,2), window,'valid')];
    size(newStroke)
end

