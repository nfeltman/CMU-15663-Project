[ objectID, drawerID, guesserID, modelID, newset, accuracy ] = drawAFriendMetaData( 'DrawAFriend_Rounds.txt' );
goodFiles = objectID(accuracy == 'Y' & ~newset,:);

valid = false(size(goodFiles,1),1);
for k = 1:size(goodFiles,1)
    f = goodFiles(k,:);
    if exist(drawAFriendFileName(f, 'P'),'file') && exist(drawAFriendFileName(f, 'S'),'file'),
       valid(k) = true;
    end
end

goodFiles = goodFiles(valid,:);
n = size(goodFiles,1);
n = min(n,200);
features = cell(n,1);
labels = cell(n,1);
numVariables = 0;
for k = 1:n
    sourcePrefix = goodFiles(k,:);
    fprintf('Loading %i/%i: %s\n',k,n,sourcePrefix);
    [featureMe, labelMe] = createLabelFeatureCombo(sourcePrefix);
    [smallFeature, smallLabel] = choseRandomRows(featureMe, labelMe, .05, .15);
    features{k,1} = smallFeature;
    labels{k,1} = smallLabel;
    numVariables = numVariables + size(smallFeature,1);
end

numVariables
full_features = zeros(numVariables,size(features{1,1},2));
full_labels = zeros(numVariables,1);

% merge the features into one giant matrix
numProcessed = 0;
for k = 1:n
    numNew = size(features{k,1},1);
    f = features{k,1};
    full_features(numProcessed +(1:numNew),:) = f;
    full_labels(numProcessed +(1:numNew),:) = labels{k,1};
    numProcessed = numProcessed + numNew;
end

numProcessed

t = classregtree(full_features, full_labels, 'method', 'regression','minparent',100);
prediction = predictImage('', '2SKWHBUmFL', t);imshow(prediction);