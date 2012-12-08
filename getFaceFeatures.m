function [ face, nose, mouth, eye, eyePairSmall, upperBody ] = getFaceFeatures( prefix )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    face = [];
    nose = [];
    mouth = [];
    eye = [];
    eyePairSmall = [];
    upperBody = [];
    imageName = drawAFriendFileName(prefix, 'P');
    if ( exist(imageName, 'file') )
        image = imread(imageName);
        [image_resize,a,b] = aspectRatio(image, 320, 460);

        nose = displayRectangleAroundFeature('Nose', image_resize);
        upperBody =  displayRectangleAroundFeature('UpperBody', image_resize);
        leftEye = displayRectangleAroundFeature('LeftEye', image_resize);
        rightEye = displayRectangleAroundFeature('RightEye', image_resize);
        eye = [leftEye;rightEye];
        eyePairSmall = displayRectangleAroundFeature('EyePairSmall', image_resize);
        mouth = displayRectangleAroundFeature('Mouth', image_resize);
        face = displayRectangleAroundFeature('FrontalFaceCART', image_resize);

        [ face, nose, eye, mouth ] = getBestFeatures( face, nose, eye, mouth );
    end
end

function [bboxes ] = displayRectangleAroundFeature(feature, image)
    detector = vision.CascadeObjectDetector(feature);
    bboxes = step(detector, image);
    
    if ( size(bboxes,1) == 0 )
       disp(['No: ', feature] );
       return;
    end
end




