
n = size(prefixesKK,1);
sumImage = 0;
for k=1:n
    file = drawAFriendFileName(prefixes(k,:),'D');
    [im,~,~] = imread(file);
    im = im2double(im);
    im = imresize(im,[100 100]); % alex, remove this line, probably!
    sumImage = sumImage + im;
end

sumImage = sumImage/n;
imwrite(sumImage,'mergedKK.png');