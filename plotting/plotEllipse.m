function plotEllipse( c, u, v, varargin )
%PLOTELLIPSE Summary of this function goes here
%   Detailed explanation goes here

z = linspace(0,2*pi);
e = [u v]*[sin(z); cos(z)] + c*ones(1,100);
plot(e(1,:),e(2,:),varargin{1:end});

end

