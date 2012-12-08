function [ percent ] = classifyStrokeWithFeatureAndRectangle(Xs, Ys, featureRectangle)
    x_min = featureRectangle(1,1);
    y_min = featureRectangle(1,2);
    x_max = featureRectangle(1,3) + x_min;
    y_max = featureRectangle(1,4) + y_min;

    
    gtX = Xs > x_min;
    gtY = Ys > y_min;
    ltX = Xs < x_max;
    ltY = Ys < y_max;
    
    insideBox = gtX & gtY & ltX & ltY;
    
    percent = sum(insideBox) ./ size(insideBox,1);
end