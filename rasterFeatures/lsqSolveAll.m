function M = lsqSolveAll( M, lambda )
%LSQSOLVEALL Perform a least squares that tries to interpolate M.
%   For each layer of M in the third dimension, create a field
%   that tries to interpolate the entries of M.  A higher lambda
%   value will means the solution is closer to M.  A lower one
%   will make the field smoother.

indexes = zeros(size(M,1),size(M,2));
n = numel(indexes);
if numel(lambda) == 1, 
    lambda = lambda*ones(n,1);
    lambdaFilter = true(n,1);
    lambdaCount = n;
else
    lambda = reshape(lambda,[],1);
    lambdaFilter = lambda ~= 0;
    lambda = lambda(lambdaFilter);
    lambdaCount = sum(lambdaFilter);
end
indexes(1:end) = 1:n;

top = reshape(indexes(1:end-1,:),1,[]);
bottom = reshape(indexes(2:end,:),1,[]);
left = reshape(indexes(:,1:end-1),1,[]);
right = reshape(indexes(:,2:end),1,[]);

numTB = numel(top);
numLR = numel(left);

i = [left, right, top, bottom, indexes(lambdaFilter')]';
j = [1:numLR, 1:numLR, numLR+(1:numTB), numLR+(1:numTB), numLR + numTB + (1:lambdaCount)]';
s = [ones(numLR,1); -ones(numLR,1); ones(numTB,1); -ones(numTB,1); lambda];

A = sparse(j,i,s,numLR+numTB+lambdaCount,n);

for k = 1:size(M,3),
    values = reshape(M(:,:,k),n,1);
    b = [zeros(numLR+numTB,1); lambda.*values(lambdaFilter)];
    M(:,:,k) = reshape(A\b,size(M,1),size(M,2));
end

end

