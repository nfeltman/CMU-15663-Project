function [ conv ] = analyzeData()
    conv = analyzeData2(123);
end

function [ conv ] = analyzeData1(numImages)

numImages = 123;
avg = loadFields(numImages);
avg = avg{1};

conv = zeros(1,numImages);
parfor k = 1: numImages,
    F = loadFields(k);
    fprintf('%03i: %i\n',k,size(F,1));
    total = 0;
    for j = 1:size(F,1)
        d = imDistance(F{j},avg);
        total = total + d;
    end
    conv(k) = total/size(F,1);
end

end

function [ conv ] = analyzeData2(numImages)

conv = zeros(1,numImages);
parfor k = 1: numImages-1,
    F1 = loadFields(k);
    F2 = loadFields(k+1);
    fprintf('%03i: %i, %i\n',k,length(F1),length(F2));
    conv(k) = multiDistance(F1,F2);
end

end


function md = multiDistance(F1,F2)
    n1 = size(F1,1);
    n2 = size(F2,1);
    
    combos = randperm(n1*n2,min(n1*n2,100));
    total = 0;
    for j = combos,
        i1 = mod(j-1,n1)+1;
        i2 = floor((j-1)/n1)+1;
        d = imDistance(F1{i1},F2{i2});
        total = total + d;
    end
    md = total / length(combos); 
end

function d = imDistance(A,B)
    A(isnan(A)) = 0;
    B(isnan(B)) = 0;

    difference = A - B;
    numerator = mag(difference);
    denominator = mag(A) + mag(B) + 0.00001;

    final = numerator ./ denominator;
    d = mean (final);
    
    if isnan(d)
        disp('=============');
        sum(isnan(A))
        sum(isnan(B))
        sum(isnan(final))
        min(denominator)
        size(final)
    end
    
end

function F = loadFields(i)

loc1 = sprintf('results/runA/fields%03iA.mat',i);
loc2 = sprintf('results/runB/fields%03i.mat',i);
loc3 = sprintf('results/runC/fields%03i.mat',i);

F = {};

if exist(loc1,'file'),
    S = load(loc1);
    F = [F; S.res];
end
if exist(loc2,'file'),
    S = load(loc2);
    F = [F; S.res];
end
if exist(loc3,'file'),
    S = load(loc3);
    F = [F; S.res];
end

end