function [ newImage, offset_width, offset_height ] = aspectRatio( image, new_width, new_height )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[width, height] = getCorrectScale(image, new_width, new_height);
newImage = imresize(image, [height, width]);
[height, width, dim] = size(newImage);

offset_width = (new_width - width) /2;
offset_height = (new_height - height)/2;

end


function [ width, height ] = getCorrectScale(image, new_width, new_height)
[height, width, dim] = size(image);
ratio = width/height;

height_scale = new_height/height;
width_scale = new_width/width;

if ( height_scale < width_scale )
    width = NaN;
    height = new_height;
else
    height = NaN;
    width = new_width;
end

end
