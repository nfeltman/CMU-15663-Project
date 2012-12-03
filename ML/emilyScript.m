drawing_file = '1103941_2520703493728906168_drawing.jpg'
image_file = '1103941_2520703493728906168_image.jpg'
feature_label = createLabelFeatureCombo(drawing_file, image_file);
feature_label_small = choseRandomRows(feature_label, .01);
emily = '10707321_2520728709025473553_image.jpg';
t = classregtree(feature_label_small(:,1:10), feature_label_small(:,11));
predication = predictImage('', emily, t);
imshow(predication);