function [ newStroke ] = convulveStrokes( stroke, sizeOfWindow )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
    window = ones(sizeOfWindow,1)/sizeOfWindow;
    newStroke =  [conv(stroke(:,1), window),conv(stroke(:,2), window)];
end

