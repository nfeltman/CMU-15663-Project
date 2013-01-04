function [ clusteredFeatures, newObjectIDs ] = clusterBasedOffHistogram( objectIDs )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    clusteredFeatures = zeros(size(objectIDs, 1), 40);
    includeObjectID = ones(size(objectIDs,1), 1);
    
    for objectIDIndex = 1:size(objectIDs,1)
       objectID = objectIDs(objectIDIndex,:)
       [bucketCount, bucket] = createBucketsFor(objectID);
       if ( size(bucketCount, 1) ~= 0 )
           if sum(bucketCount) ~= 0
                bucketCount = bucketCount / sum(bucketCount);
                clusteredFeatures(objectIDIndex,:) = bucketCount;
           else
              includeObjectID(objectIDIndex) = 0;
          end
           
           
       else
           disp([objectID, ' bucket empty']);
           includeObjectID(objectIDIndex) = 0;
       end
    end
    
    includeObjectID = includeObjectID == 1;
    newObjectIDs = objectIDs(includeObjectID,:);
    clusteredFeatures = clusteredFeatures(includeObjectID,:);
end

