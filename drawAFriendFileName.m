function [ fileName ] = drawAFriendFileName( preFix, fileType  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    postFix = drawAFriendPostFix(fileType);
    fileName = [preFix, postFix];
end

function [postFix] = drawAFriendPostFix(fileType)
    if ( fileType == 'D')
        postFix = '_drawing.png';
    elseif ( fileType == 'P')
        postFix = '_picture.png';
    elseif ( fileType == 'S')
        postFix = '_drawingObject.csv';
    elseif ( fileType == 'G')
        postFix = '_guessObject.csv';
    end
end

