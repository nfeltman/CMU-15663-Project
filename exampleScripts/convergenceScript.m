numberOfPictures = size(X,2);
numberOfRuns = 10;
sumSquaredArray = zeros(numberOfRuns,numberOfPictures);

for i = 2:numberOfPictures
    disp('picture')
    disp(i)
   for run = 1:numberOfRuns 
       disp('run')
       disp(run)
        randomIndex = randperm(numberOfPictures,i);
        subX = X(:,randomIndex);
        subY = Y(:,randomIndex);
        [subAvg, subScore] = findSmartAverage(subX,subY);
        difference = subAvg - avg;
        squared = difference .* difference;
        total = mean(sum(squared,2));
        sumSquaredArray(run, i) = total;
   end
   
   disp(floor(sumSquaredArray(:,1:i)))
end