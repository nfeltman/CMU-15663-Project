function [ output_args ] = partitionStrokes( strokes )
%PARTITIONSTROKES Summary of this function goes here
%   Detailed explanation goes here

smooth = @(o) cconv(o,[0.25 0.5 0.25],size(o,2)); %note that this shifts the values

ori =  cell2mat(cellmap(@(s)smooth(smooth(strokeOrrientation(s))), strokes));
diffO = sqrt(sum((ori(2:end,:) - ori(1:end-1,:)).^2,2));

 ori2 =  cell2mat(cellmap(@(s)(strokeOrrientation(s)), strokes));
 diffO2 = sqrt(sum((ori2(2:end,:) - ori2(1:end-1,:)).^2,2));
figure; imagesc(ori2);
figure; imagesc(ori);


cen =  cell2mat(cellmap(@getWeightedCentroid, strokes));

deltaC = getSegDeltas(cen);
leftDiff = sqrt(sum((ori(2:end,:) - ori(1:end-1,:)).^2,2));


%plot(cen(:,1 ),cen(:,2));

%diffC = diffC/max(diffC);
figure; plot([diffO diffO2])

figure;
drawImageStrokes(strokes,1:65,'cluster');
hold on;
plot(cen(:,1),cen(:,2),'o-');
hold off;
fixAxes;
end

function c = getWeightedCentroid(s)
centers = getSegCenters(s);
lengths = sqrt(getSegLength2(s));

c = sum(centers .* (lengths*[1 1]),1)/sum(lengths);

%c = [c mean(s,1)];

end

function [ bucketValues ] = strokeOrientation( stroke )
    stroke = convulveStrokes(stroke, 10);
    deltas = getSegDeltas(stroke);
    diffRatio = abs(deltas(:,1)./deltas(:,2));
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
     
end