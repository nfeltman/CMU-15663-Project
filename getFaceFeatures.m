function [ face, nose, mouth, leftEye, rightEye, eyePairSmall, upperBody ] = getFaceFeatures( prefix )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    image = imread(drawAFriendFileName(prefix, 'P'));
    [image_resize,a,b] = aspectRatio(image, 320, 460);

    nose = displayRectangleAroundFeature('Nose', image_resize);
	upperBody =  displayRectangleAroundFeature('UpperBody', image_resize);
    leftEye = displayRectangleAroundFeature('LeftEye', image_resize);
    rightEye = displayRectangleAroundFeature('RightEye', image_resize);
    eyePairSmall = displayRectangleAroundFeature('EyePairSmall', image_resize);
    mouth = displayRectangleAroundFeature('Mouth', image_resize);
    face = displayRectangleAroundFeature('FrontalFaceCART', image_resize);
end

function [bboxes ] = displayRectangleAroundFeature(feature, image)
    detector = vision.CascadeObjectDetector(feature);
    bboxes = step(detector, image);
    
    if ( size(bboxes,1) == 0 )
       disp(['No: ', feature] );
       return;
    end
end


