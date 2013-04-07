numberOfPictures = size(X,2);
numberOfRuns = 100;
sumSquaredArray = zeros(numberOfRuns,numberOfPictures);


% for i = 100:numberOfPictures
tic

for i = 1:50
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
        numerator = mag(difference);
        denominator = mag(subAvg) + mag(avg);
        
        final = numerator ./ denominator;
        
        %figure(1);
        %    finalImage = reshape(final,460,320);

         %   imagesc(log(finalImage+.1));
    %hold on
    %    fixAxes();
    %    hold off
                
        total = mean(final)
        sumSquaredArray(run, i) = total;
   end
   
   %disp(floor(sumSquaredArray(:,1:i)))
end

toc

