function [ distance ] = cellDistance( X,Y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    points = [X,Y];
    pointsShifted = points(2:end,:);
    pointsShifted = [pointsShifted; 0,0];
    pointsDifference = pointsShifted - points;
    pointsDifference = pointsDifference(1:end-1,:);
    squareDifference = pointsDifference.^2;
    distance = sum(sum(squareDifference));
end

