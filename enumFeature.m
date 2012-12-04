function [ enum ] = enumFeature( featureType )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    if ( strcmp('mouth',featureType) )
        enum = 1;
    elseif ( strcmp('face', featureType) )
        enum = 2;
    elseif (strcmp('nose', featureType))
        enum = 3;
    elseif (strcmp('mouth', featureType))
        enum = 4;
    elseif (strcmp('eye', featureType))
        enum = 5;
    else 
       assert(false, 'Feature Type does not exist'); 
    end
end

