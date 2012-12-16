function [ returnColor ] = colorFromFeatureEnum( featureEnum )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    if ( featureEnum == 0 )
        returnColor = 'white';
        
    elseif ( featureEnum == 1 )
        returnColor = 'm';
    elseif ( featureEnum == 2 )
        returnColor =  'c';
    elseif ( featureEnum == 3 )
        returnColor = 'green';
    elseif ( featureEnum == 4 )
        returnColor = 'yellow';
    elseif ( featureEnum == 5 )
        returnColor = 'red';                        
    else
        returnColor = 'white';
    end
end

