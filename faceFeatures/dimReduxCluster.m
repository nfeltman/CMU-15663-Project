function idx = dimReduxCluster( X,Y,D , hires)
%DIMREDUXCLUSTER Summary of this function goes here
%   Detailed explanation goes here

main = 14; % 14, 40, 73, 80, 90, 121

figure(1)
imagesc(reshape(hires(main,:),200,200));
colormap('gray');

figure(2);showPics(main,[X Y],hires);
figure(3);showPics(main,[X Y D*0.5],hires);
figure(4);showPics(main,[X Y D],hires);

%figure(2);showPics(main,[X Y D*2],hires);
%figure(6);showPics(main,[X Y D*10],hires);
%figure(5);showPics(main,D,hires);


end

function showPics(main, features, hires)

    dist2 = sum((features - ones(size(hires,1),1)*features(main,:)).^2,2);
    [~,idx] = sort(dist2);

    for k = 1:8,
        subplot(2,4,k);
        imagesc(reshape(hires(idx(k+1),:),200,200)); 
        colormap('gray');
        axis tight
        axis off
        axis equal
        title(sprintf('Closest #%i',k));
    end
end