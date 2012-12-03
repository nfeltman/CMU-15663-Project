function [ feature ] = getEdgeFeature( gray )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    [junk threshold] = edge(gray, 'sobel');
    fudgeFactor = .5;
    BWs = edge(gray,'sobel', threshold * fudgeFactor);
    %figure, imshow(BWs), title('binary gradient mask');
    feature = BWs;
%    imshow(feature);
    dFeature = double(feature);
    H = fspecial('disk',10);
    blurred = imfilter(dFeature,H,'replicate');
    feature = blurred;
 %   imshow(blurred);
end

