drawing_file = '1103941_2520703493728906168_drawing.jpg'
image_file = '1103941_2520703493728906168_image.jpg'
feature_label = createLabelFeatureCombo(drawing_file, image_file);
feature_label_small = choseRandomRows(feature_label, .3);
%emily = '10707321_2520728709025473553_image.jpg';
emily = '1103941_2520703493728906168_image.jpg';

t = classregtree(feature_label_small(:,1:end-1), feature_label_small(:,end));
predication = predictImage('', emily, t);
figure();
imshow(predication);