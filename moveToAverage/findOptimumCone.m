function [ U, score ] = findOptimumCone( X, Y )
%FINDOPTIMUMCONE Summary of this function goes here
%   Detailed explanation goes here

n = size(X,1);
alpha = 4;
beta = 0.5;

denom = sqrt(X.*X+Y.*Y) + beta;
o = ones(1,size(X,2));

% bestScore = inf;
% ux = ones(n,1);
% uy = sqrt(1-ux.*ux);
% for k = 1:10,
%     
%     dotProd = (ux*o).*X + (uy*o).*Y;
%     scores = 1-(abs(dotProd)./denom);
%     towardZero = 1-(dotProd > 0)*2;
%     factor = alpha*scores.^(alpha-1).*towardZero./denom;
%     gux = sum(X.*factor,2);
%     guy = sum(Y.*factor,2);
%     
%     score = sum(scores,2)
%     
%     ux = ux + gux*0.5;
%     uy = uy + guy*0.5;
%     len = sqrt(ux.*ux+uy.*uy);
%     ux = ux./len;
%     uy = uy./len;
% end

U = zeros(n,2);
for k = 1:n
    x = X(k,:)';
    y = Y(k,:)';
    [~,~,V] = svds([x y],1);
    U(k,:) = V';
end

ux = U(:,1);
uy = U(:,2);

dotProd = (ux*o).*Y - (uy*o).*X;
score = mean((1-abs(dotProd)./denom).^alpha,2);


end

