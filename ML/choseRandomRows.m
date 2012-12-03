function [ smaller_matrix ] = choseRandomRows( matrix, percentage )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [rows, cols] = size(matrix);
    random_rows = rand(rows, 1);
    random_rows = random_rows < percentage;
    smaller_matrix = matrix(random_rows, :);
end

