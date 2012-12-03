function [ newObjectIds ] = getObjectIDsFromArtist( objectIDs, artistIDs, artist )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    artistIDIndex = artistIDs == artist;
    newObjectIds = objectIDs(artistIDIndex, :);
end

