function [ output_args ] = testFace( prefix )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    image = imread(drawAFriendFileName(prefix, 'P'));
    [image_resize,a,b] = aspectRatio(image, 320, 460);
    imshow(image_resize);
    
    hold on
    [ face, nose, mouth, eye, eyePairSmall, upperBody ] = getFaceFeatures( prefix );
        displayRectangleAroundFeature('nose', nose);    
        displayRectangleAroundFeature('eye', eye);
        displayRectangleAroundFeature('mouth',mouth);
        displayRectangleAroundFeature('face',face);
    hold off
end

function [ ] = displayRectangleAroundFeature(featureType, bboxes)
    colorType = colorFromFeatureEnum(enumFeature(featureType));
        
   for boxIndex = 1:size(bboxes,1)
      rectangle('Position',bboxes(boxIndex,:), 'EdgeColor', colorType);        
   end
end

