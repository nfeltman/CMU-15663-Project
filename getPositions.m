function [ X, Y ] = getPositions( strokeFile )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    fileID = fopen(strokeFile);
    C = textscan(fileID, '%d %d %f %f %f %f %s %f %*[\n]','delimiter',',');
    X = C(3);
    X = X{1};
    Y = C(4);
    Y = Y{1};
    fclose(fileID);
    
    strokeType = C{7};
    
    if ( size(X,1) == 0 )
        X = [];
        Y = [];
        return;
    end
    
    [X, Y] = splitStrokes(X, Y, strokeType);
end

function [newX, newY] = splitStrokes(X, Y, strokeType)
    [X,Y, strokeType] = makeSureEndsInE(X,Y, strokeType);
    strokeArray = cell2mat(strokeType);
    
    strokeBool = strokeArray == 'M';
    strokeBool = strokeArray == 'M';
    strokeEqual0 = find(strokeBool == 0);
    strokeEqual0 = [0;strokeEqual0];
    strokeEqual0Next = [strokeEqual0(2:size(strokeEqual0,1));0];
    strokeSize = strokeEqual0Next - strokeEqual0;
    strokeSizeCut = strokeSize(1:size(strokeSize,1)-1);    
    newX = mat2cell(X, strokeSizeCut',1);
    newY = mat2cell(Y, strokeSizeCut',1);
end

function [X, Y, strokeType] = makeSureEndsInE(X, Y, strokeType)
    if ( strokeType{size(strokeType,1)} ~= 'E' )
       X = [X; X(size(X,1))];
       Y = [Y; Y(size(Y,1))];
       strokeType{size(strokeType,1) + 1} = 'E'; 
    end
end

