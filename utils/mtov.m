function [ v ] = mtov( matrix )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    v = double(reshape(matrix, [], 1));
end