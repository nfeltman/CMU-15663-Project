function [ objectID, drawerID, guesserID, modelID ] = drawAFriendMetaData( metaDataFile )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    fileID = fopen(metaDataFile);
    %    return [NSString stringWithFormat:@"%@,%f,%@,%@,%@,%@,%@,%@\n", self.objectId, [self.createdAt timeIntervalSince1970], self.drawerFacebookID, self.guesserFacebookID, self.modelFacebookID, self.modelFirstName, self.modelLastName, [self wonString]];
    % self.objectId,createdAt,drawerFacebookID,guesserFacebookID,modelFacebookID,modelFirstName,modelLastName,wonString
    
    C = textscan(fileID, '%s %f %u64 %u64 %u64 %s %s %s %*[\n]','delimiter',',');    
    fclose(fileID);

    objectID = cell2mat(C{1});
    drawerID = C{3};
    guesserID = C{4};
    modelID = C{5};
end

