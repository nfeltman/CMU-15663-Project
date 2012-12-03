sourcePrefix = '1Qyih77fDV'
feature_label = createLabelFeatureCombo(sourcePrefix);
feature_label_small = choseRandomRows(feature_label, .01);

predictPrefix = '2SKWHBUmFL'
t = classregtree(feature_label_small(:,1:10), feature_label_small(:,11));
prediction = predictImage('', predictPrefix, t);
imshow(prediction);