function [ x ] = lsqStrokes(target0, target1, weights1 )
%LSQSTROKES Summary of this function goes here
%   Detailed explanation goes here

n = size(target0,1);
if numel(weights1) == 1, 
    weights1 = weights1 * ones(n-1,1); 
end

A0 = sparse(1:n,1:n,ones(n,1));
A1 = sparse([1:n-1, 1:n-1],[1:n-1, 2:n],[-weights1; weights1]);

A = [A0; A1];
b = [target0; (weights1*ones(1,size(target1,2))).*target1];
x = A\b;

end

