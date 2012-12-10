function [wX, wY] = doubleWrap( dX, dY )

wX = dX.^2 - dY.^2;
wY = 2 * dX .* dY;

end

