function [ lambda1, lambda2, U ] = smallEigs( a, b, c )
%SMALLEIGS Small Matrix Eigs
%   Finds the eigs for a 2-by-2 matrix

discriminant = sqrt((a-c).^2+4*b.*b);
lambda1 = (a+c + discriminant) / 2;
lambda2 = (a+c - discriminant) / 2;

ux = a - lambda2;
uy = b;
uLen = sqrt(ux.*ux+uy.*uy);
ux = ux./uLen;
uy = uy./uLen;
U = [ux, uy];

%sum(sum(abs([ux.*a+uy.*b, ux.*b+uy.*c] - [lambda1.*ux, lambda1.*uy])))

end

