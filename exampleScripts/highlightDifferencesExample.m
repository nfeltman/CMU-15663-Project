
B = getPositions(drawAFriendFileName('9zkRrokirT','S'));
B = extractSegs(B)/2.5;

targets = ['4R56rYWZfQ';'9ggZFhGnnO';'E5znYs8nrI';'dpzhjaPg5T'; ...
    'EaevUQv9A7';'Hss07oWTUY';'mobldcT3bY';'qUeZYAL0IZ';'Syt9xsCCzO'; ...
    'u1uPtY8qjV';'yOijC9dBmf';'Zety8LiUdt'];

n = size(targets,1);

if ~exist('solvedFields','var')% || true,
    w = 140;
    h = 200;
    allX = zeros(h,w,n);
    allY = zeros(h,w,n);
    allMass = zeros(h,w,n);
    for k = 1:n,
        k
        A = getPositions(drawAFriendFileName(targets(k,:),'S'));
        A = filterDuplicatePoints(A);
        A = cellmap(@(s)splitLongSegs(s/2.5,1),A);
        A = extractSegs(A);
        [X,Y] = createUnwrappedSlopeField(A, [h w], 0.1, 'lsq', 0.001);
        allX(:,:,k) = X;
        allY(:,:,k) = Y;
        allMass(:,:,k) = createDensityField(A, [h w], 1);
    end
    
    solvedFields = cat(4,allX,allY,allMass);
end

figure; hold on;
col = lines;
for k = 1:n,
    A = getPositions(drawAFriendFileName(targets(k,:),'S'));
    A = filterDuplicatePoints(A);
    A = cellmap(@(s)splitLongSegs(s/2.5,1),A);
    A = extractSegs(A);
    plot([A(:,1) A(:,3)]',[A(:,2) A(:,4)]','Color',col(k,:));
end

% totalStd = sqrt(var(solvedFields(:,:,:,1),[],3)+var(solvedFields(:,:,:,2),[],3));
% %totalStd(totalStd<0.4)=0;
% totalDens = mean(solvedFields(:,:,:,3),3);
% imagesc(totalStd);
% colormap 'hot'
fixAxes
% figure; imagesc(totalDens);
% fixAxes