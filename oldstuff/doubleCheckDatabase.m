function [ badID ] = doubleCheckDatabase( objectids )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    numberOfObjectIDs = size(objectids,1);
    ignoreFile = fopen('ignore.txt', 'at');

    for objectIDIndex = 1:numberOfObjectIDs
        objectID = objectids(objectIDIndex,:);
        disp(objectID);
        drawImageWithPrefix(objectID)
        figure();
        testFace(objectID);
        
        reply = input('Is this a good drawing? Y/N [Y]: ', 's');
        
        if ( strcmp(reply, '') )
            reply = 'Y';
        end

        if reply == 'N'
           fprintf(ignoreFile,'%s\n', objectids(objectIDIndex,:)) ;
        end
        
        close all
    end
    
    fclose(ignoreFile);
    
    badID = 0;
end



