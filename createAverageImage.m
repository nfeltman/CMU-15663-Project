function [ averageImage ] = createAverageImage( directory )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    files = dir([directory, '*JPG'])

    n = size(files,1);
    sumImage = 0;
    for k=1:n
        file = files(k).name;
        [im,~,~] = imread([directory,file]);
        im = im2double(im);
        % im = imresize(im,[100 100]); % alex, remove this line, probably!
        sumImage = sumImage + im;
    end

    sumImage = sumImage/n;
%    imwrite(sumImage,'mergedKK.png');
    averageImage = sumImage;
end

