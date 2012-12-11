function [ objectID, drawerID, guesserID, modelID, newset, accuracy ] = drawAFriendMetaData( metaDataFile )
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
    newset = strcmp('(null)',C{7});
    accuracy = cell2mat(C{8});
    
    removeGame(objectID, drawerID, guesserID, modelID, newset, accuracy, 100003121308246, 1103941);
end

function [ objectID, drawerID, guesserID, modelID, newset, accuracy] = removeGame( objectID, drawerID, guesserID, modelID, newset, accuracy, player1, player2)
    gameIndex = (player1 == drawerID & player2 == guesserID) | (player2 == drawerID & player1 == guesserID);
    objectID = objectID(~gameIndex,:);
    drawerID = drawerID(~gameIndex,:);
    guesserID = guesserID(~gameIndex,:);
    modelID = modelID(~gameIndex,:);
    newset = newset(~gameIndex,:);
    accuracy = accuracy(~gameIndex,:);
end



