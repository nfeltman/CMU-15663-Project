function [X,Y] = createAttractorKernels( n )

[X,Y] = meshgrid(-n:n,-n:n);
mag = sqrt(X.^2+Y.^2);
mag(n+1,n+1) = 1;

g1 = fspecial('gaussian',2*n+1,n*0.4);
g2 = fspecial('gaussian',2*n+1,1);
g = g1 - g2 * (g1(n+1,n+1)/g2(n+1,n+1));

X = -X.*g./mag;
Y = -Y.*g./mag;

end

