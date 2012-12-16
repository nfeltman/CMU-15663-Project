function [ output_args ] = partitionStrokes( strokes )
%PARTITIONSTROKES Summary of this function goes here
%   Detailed explanation goes here

if numel(strokes)==0,
    error('No stroke data!');
end

smooth = @(o) cconv(o,[0.25 0.5 0.25],size(o,2)); %note that this shifts the values

numbins = 16;
ori =  cell2mat(cellmap(@(s)smooth(smooth(strokeOrientation(s, numbins))), strokes));
first = ori(2:end,:);
second = ori(1:end-1,:);
diffO1 = sum(abs(first - second),2);
diffO2 = sum(abs(first - circshift(second,[0 -1])),2);
diffO3 = sum(abs(first - circshift(second,[0 1])),2);
diffO = min([diffO1 diffO2 diffO3],[], 2);
cut = diffO > 0.8;

% ori2 =  cell2mat(cellmap(@(s)(strokeOrientation(s)), strokes));
% diffO2 = sum(abs(ori2(2:end,:) - ori2(1:end-1,:)),2);
% figure; image(ori2*50);
figure; imagesc(ori);
figure; plot([diffO1 diffO]);
% 
cen =  cell2mat(cellmap(@getWeightedCentroid, strokes));
% 
% deltaC = getSegDeltas(cen);
% leftDiff = sqrt(sum((ori(2:end,:) - ori(1:end-1,:)).^2,2));
% 

%plot(cen(:,1 ),cen(:,2));

%diffC = diffC/max(diffC);
% 
% figure;
labels = cumsum([1 cut']);
p = randperm(labels(end));
figure; drawImageStrokes(strokes,p(labels),'cluster');
% hold on;
% plot(cen(:,1),cen(:,2),'o-');
% hold off;
fixAxes;
end

function c = getWeightedCentroid(s)
centers = getSegCenters(s);
lengths = sqrt(getSegLength2(s));

c = sum(centers .* (lengths*[1 1]),1)/sum(lengths);

%c = [c mean(s,1)];

end

function [ bucketValues ] = strokeOrientation( stroke, numbins )
    stroke = convulveStrokes(stroke, 4);
    deltas = getSegDeltas(stroke);
    len = sqrt(sum(deltas.^2,2));
    angles = atan2(deltas(:,2),deltas(:,1));
    binsize = 2*pi/numbins;
    indeces = ceil((angles+pi)/binsize);
    bucketValues = accumarray(indeces,len,[numbins 1])';
    if sum(bucketValues) == 0,
        bucketValues = ones(1,numbins);
    end
    bucketValues = bucketValues / sum(bucketValues);
end