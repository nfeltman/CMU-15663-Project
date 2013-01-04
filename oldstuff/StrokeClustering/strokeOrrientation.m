function [ bucketValues ] = strokeOrrientation( stroke )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
    stroke = convulveStrokes(stroke, 10);
    strokesAhead = 2;
    nextStroke = [stroke(strokesAhead:end,:);zeros(strokesAhead-1,2)];
    difference = nextStroke - stroke;
    difference = difference(1:end-strokesAhead,:);
    diffRatio = difference(:,1)./difference(:,2);
    angles = atan(diffRatio);
    
    [bucketValues, buckets] = hist(angles,-pi/2:.1:pi/2);
    [~, modeAngleIndex] = max(bucketValues);
    modeAngle = buckets(modeAngleIndex);
    
    angles = angles - modeAngle;

    anglesLessThanPi2 = angles <= -1*pi/2;
    angles(anglesLessThanPi2) = angles(anglesLessThanPi2) + pi;
    
    angleMoreThanPi2 = angles >= pi/2;
    angles(angleMoreThanPi2)  = angles(angleMoreThanPi2) - pi;
    
    [bucketValues, ~] = hist(angles,-pi/2:.1:pi/2);
    bucketValues = bucketValues / sum(bucketValues);
       
    %hist(angles,-pi/2:.1:pi/2);
end




