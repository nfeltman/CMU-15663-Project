function [ output_args ] = angleHistogramVsStroke( stroke )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
    subplot(2,1,1);
    strokeOrrientation(stroke);
    subplot(2,1,2);
    drawImageStrokes({stroke(:,1)},{stroke(:,2)}, [],[]);
end

