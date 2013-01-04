function plotFlow( X, Y, sparsity, arrowscale )
    if nargin < 3,
        sparsity = 1;
    end
    if nargin < 4,
        arrowscale = 1;
    end
    
    [mX, mY] = meshgrid(1:sparsity:size(X,2),1:sparsity:size(X,1));
    mX = mX(1:end);
    mY = mY(1:end);
    mI = (mX-1) * size(X,1) + mY;
    
    % get arrow directions
    u = X(mI)*arrowscale;
    v = Y(mI)*arrowscale;
    
    % supress the graph where the field is 0
    valid = u~=0 | v~=0;
    mX = mX(valid);
    mY = mY(valid);
    u = u(valid);
    v = v(valid);
    
    % scoot the arrows backwards
    mXb = mX - u/2;
    mYb = mY - v/2;
    
    quiver(mXb,mYb,u,v,'.r','AutoScale','off');
%    hold on; scatter(mX,mY,'.'); hold off;
    axis('equal')
    set(gca,'xtick',[],'ytick',[],'YDir','reverse')
end

