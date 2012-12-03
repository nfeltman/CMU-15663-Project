function [ newImage ] = burnLineOnImage( Xs, Ys, image )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    pointCount = size(Xs,1);
    
    newImage = image;
    
    x0 = Xs(1);
    y0 = Ys(1);
    
    for pointIndex = 2:pointCount
       x1 = Xs(pointIndex);
       y1 = Ys(pointIndex);
       newImage = burnLineOnImageWithPoint(x1, x0, y1, y0, newImage);
       x0 = x1;
       y0 = y1;
    end
end

function [newImage] = burnLineOnImageWithPoint(Ox1, Ox0, Oy1, Oy0, image)

        x1 = Ox1;
        x0 = Ox0;
        y1 = Oy1;
        y0 = Oy0;
    
    newImage = image;
    deltax = x1 - x0;
    deltay = y1 - y0;
    
    
    if deltax == 0 && deltay == 0 
       newImage = writeToImage(newImage, round(y0), round(x0));
       return;
    end
 
    if deltax ~= 0 

        error = 0;
        deltaerr = abs (deltay / deltax);   %// Assume deltax != 0 (line is not vertical),
              % // note that this division needs to be done in a way that preserves the fractional part
        y = y0;
        step = 1;
        if x0 > x1
            step = -1;
        end
        
        if y0 < y1
           yStep = 1;
        else
           yStep = -1;
        end
        
        for x = x0:step:x1
            newImage = writeToImage(newImage, round(x), round(y));

             error = error + deltaerr;
             if error >= 0.5 
                 y = y + yStep;
                 error = error - 1.0;
             end
        end
        
    else
        t_x = deltax;
        deltax = deltay;
        deltay = t_x;
        t_x0 = x0;
        t_x1 = x1;
        x0 = y0;
        x1 = y1;
        y0 = t_x0;
        y1 = t_x1;
        
        error = 0;
        deltaerr = abs (deltay / deltax);   %// Assume deltax != 0 (line is not vertical),
              % // note that this division needs to be done in a way that preserves the fractional part
        y = y0;
        step = 1;
        if x0 > x1
            step = -1;
        end
        
        if y0 < y1
           yStep = 1;
        else
           yStep = -1;
        end
        
        for x = x0:step:x1    
            newImage = writeToImage(newImage, round(y), round(x));
            
             error = error + deltaerr;
             if error >= 0.5 
                 y = y + yStep;
                 error = error - 1.0;
             end
        end
        
    end
    
    
end

function [image] = writeToImage(image, x, y)

    if ( x > 0 && y > 0 && x <= size(image,2) && y <= size(image,1) )
       image(y,x) = 1;
    end

end

function [image] = writeIfInBounds(image, x, y)
    for X = x
       for Y = y
          image = writeIfInBounds(image, X, Y);
       end
    end

end

