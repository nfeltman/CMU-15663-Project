function [ output_args ] = plotStrokes( strokes )
%PLOTSTROKES Summary of this function goes here
%   Detailed explanation goes here

hold on
for k = 1:numel(strokes)
    segs = strokes{k};
    plot(segs(:,1), segs(:,2),'.-k');
end

end

