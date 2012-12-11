function [ output_args ] = displayClusters( clusters,numberOfClusters, cell )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    rows = ceil(sqrt(numberOfClusters));
    
    for clusterIndex = 1:numberOfClusters
       eye = cell(clusterIndex == clusters);
       averageEye = averageEyeCell(eye);
       subplot(rows, rows, clusterIndex);
       imshow(averageEye);
    end
    
    figure();
    numberOfExamples = 10;
    
    
    for clusterIndex = 1:numberOfClusters
       eye = cell(clusterIndex == clusters);
       averageEye = averageEyeCell(eye);
       
       subplot(numberOfClusters, numberOfExamples+1, (numberOfExamples + 1) * (clusterIndex -1 ) + 1);
       imshow(averageEye);

       for exampleIndex = 1:numberOfExamples
           subplot(numberOfClusters, numberOfExamples+1, (numberOfExamples + 1) * (clusterIndex -1 ) + 1 + exampleIndex);
           if ( exampleIndex <= size(eye,2) )
              imshow(eye{exampleIndex}); 
           end
       end
       
    end



end

