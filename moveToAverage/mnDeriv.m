function [dx,expo] = mnDeriv( a, B, x )
%MNDERIV Multinomial Derivative
%   Takes the derivative at x of the multinomial defined by a and B.

v = a + B*x;
dx = sum(B./(v*ones(1,size(B,2))),1);
expo = sum(log(v));

end

