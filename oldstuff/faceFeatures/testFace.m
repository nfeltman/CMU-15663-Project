function [ output_args ] = testFace( prefix )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    image = imread(drawAFriendFileName(prefix, 'P'));
    [image_resize,a,b] = aspectRatio(image, 320, 460);
    imshow(image_resize);
    
    hold on
   % [ face, nose, mouth, eye, eyePairSmall, upperBody ] = getFaceFeatures( prefix );
    [ features ] = getFaceFeatures( prefix );
        displayRectangleAroundFeature('nose', features{enumFeature('nose')});    
        displayRectangleAroundFeature('eye', features{enumFeature('eye')});
        displayRectangleAroundFeature('mouth',features{enumFeature('mouth')});
        displayRectangleAroundFeature('face',features{enumFeature('face')});
    hold off
end

function [ ] = displayRectangleAroundFeature(featureType, bboxes)
    colorType = colorFromFeatureEnum(enumFeature(featureType));
        
   for boxIndex = 1:size(bboxes,1)
      rectangle('Position',bboxes(boxIndex,:), 'EdgeColor', colorType);        
   end
end

