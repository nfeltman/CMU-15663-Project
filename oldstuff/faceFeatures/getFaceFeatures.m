function [ features ] = getFaceFeatures( image )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    if ischar(image)
        imageName = drawAFriendFileName(image, 'P');
        if ( exist(imageName, 'file') )
            image = imread(imageName);
            [image,~,~] = aspectRatio(image, 320, 460);
        else
            % consider returning something else?
            warning('Image file not found! (consult comments here for fixes)');
            features = {};
            return;
        end
    end

    nose = displayRectangleAroundFeature('Nose', image);
    upperBody =  displayRectangleAroundFeature('UpperBody', image);
    leftEye = displayRectangleAroundFeature('LeftEye', image);
    rightEye = displayRectangleAroundFeature('RightEye', image);
    eye = [leftEye;rightEye];
    eyePairSmall = displayRectangleAroundFeature('EyePairSmall', image);
    mouth = displayRectangleAroundFeature('Mouth', image);
    face = displayRectangleAroundFeature('FrontalFaceCART', image);

    [ face, nose, eye, mouth ] = getBestFeatures( face, nose, eye, mouth );

    features = {};
    features{enumFeature('face')} = face;
    features{enumFeature('nose')} = nose;
    features{enumFeature('mouth')} = mouth;
    features{enumFeature('eye')} = eye;
    features{enumFeature('eyePair')} = eyePairSmall;
    features{enumFeature('upperBody')} = upperBody; 
end

function [bboxes ] = displayRectangleAroundFeature(feature, image)
    detector = vision.CascadeObjectDetector(feature);
    bboxes = step(detector, image);
    
    if ( size(bboxes,1) == 0 )
       disp(['No: ', feature] );
       return;
    end
end




