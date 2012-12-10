function [ boolImage ] = createStrokeImage( imagePrefix )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [image, X, Y] = getPositionsAdjusted(imagePrefix);
    strokeImageSize = size(image)
    
    boolImage = zeros(size(image,1), size(image,2));
    
    boolImageSize = size(boolImage)
    sizeY = size(boolImage,1);
    
    numberOfStrokes = size(X,1);
    
    for strokeIndex = 1:numberOfStrokes
        boolImage = burnLineOnImage(X{strokeIndex}, Y{strokeIndex}, boolImage);
        if ( sizeY ~= size(boolImage,1) )
           disp('size changed');
           strokeIndex
        end
    end

        boolImageSize = size(boolImage)

end

