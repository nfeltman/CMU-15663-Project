function [ badID ] = doubleCheckDatabase( objectids )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    numberOfObjectIDs = size(objectids,1);
    ignoreFile = fopen('ignore.txt', 'at');

    for objectIDIndex = 1:numberOfObjectIDs
        drawImageWithPrefix(objectids(objectIDIndex,:))
        
        reply = input('Is this a good drawing? Y/N [Y]: ', 's')
        
        if ( strcmp(reply, '') )
            reply = 'Y'
        end

        if reply == 'N'
           fprintf(ignoreFile,'%s\n', objectids(objectIDIndex,:)) ;
        end
        
        close all
    end
    
    fclose(ignoreFile);
    
    badID = 0;
end



