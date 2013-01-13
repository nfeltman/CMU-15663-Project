function [ output_args ] = convertAvgToCode( avg, fileName )
%CONVERTAVGTOCODE Summary of this function goes here
%   Detailed explanation goes here
    fid = fopen(fileName, 'w');
    %X = reshape(avg(:,1),460,320);
    
    fprintf(fid,'static double dY[%d] = {\n', 320*460);
    
    for avgIndex = 1:320*460
        if ( avgIndex == 320*460 )
            fprintf(fid, '%f',avg(avgIndex,2));    
        else
            fprintf(fid, '%f,',avg(avgIndex,2));
        end
    end
    
    fprintf(fid, '};\n\n');
    
    
    
%        fid = fopen([fileName, '_x.txt'], 'w');
    %X = reshape(avg(:,1),460,320);
    
    
    fprintf(fid,'static double dX[%d] = {\n', 320*460);
    
    for avgIndex = 1:320*460
        if ( avgIndex == 320*460 )
            fprintf(fid, '%f',avg(avgIndex,1));    
        else
            fprintf(fid, '%f,',avg(avgIndex,1));
        end
    end
    
    fprintf(fid, '};');
end

