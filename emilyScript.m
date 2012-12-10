sourcePrefix = '1Qyih77fDV'
feature_label = createLabelFeatureCombo(sourcePrefix);
feature_label_small = choseRandomRows(feature_label, .4);
t = classregtree(feature_label_small(:,1:10), feature_label_small(:,11));

predictPrefix = '2SKWHBUmFL'
prediction = predictImage('', predictPrefix, t);
imshow(prediction);