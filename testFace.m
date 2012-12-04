function [ output_args ] = testFace( prefix )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    image = imread(drawAFriendFileName(prefix, 'P'));
    [image_resize,a,b] = aspectRatio(image, 320, 460);
    imshow(image_resize);
    
    hold on
        displayRectangleAroundFeature('Nose', colorFromFeatureEnum(enumFeature('nose')),image_resize);
        %displayRectangleAroundFeature('UpperBody', 'yellow',image_resize);
        displayRectangleAroundFeature('LeftEye', colorFromFeatureEnum(enumFeature('eye')),image_resize);
        displayRectangleAroundFeature('RightEye', colorFromFeatureEnum(enumFeature('eye')),image_resize);
        %displayRectangleAroundFeature('EyePairSmall', 'c',image_resize);
        displayRectangleAroundFeature('Mouth', colorFromFeatureEnum(enumFeature('mouth')),image_resize);
        displayRectangleAroundFeature('FrontalFaceCART', 'black',image_resize);
    hold off
    


end

function [ ] = displayRectangleAroundFeature(feature, colorType, image)
    detector = vision.CascadeObjectDetector(feature);
    bboxes = step(detector, image)
    
    if ( size(bboxes,1) == 0 )
       disp(['No: ', feature] );
       return;
    end
    
    
    for boxIndex = 1:size(bboxes,1)
       rectangle('Position',bboxes(boxIndex,:), 'EdgeColor', colorType);        
    end
end

