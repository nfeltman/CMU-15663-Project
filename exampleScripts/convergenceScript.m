numberOfPictures = size(X,2);
%numberOfRuns = 3;

safeSave = @(res,i)(save(sprintf('results/runC/fields%03i',i),'res'));

% for i = 100:numberOfPictures
tic
parfor i = 1:numberOfPictures
   
    if i <= 20,
        numberOfRuns = 100;
    elseif i <= 50,
        numberOfRuns = 20;
    elseif i <= 100
        numberOfRuns = 10;
    else
        numberOfRuns = 3;
    end
    results = cell(numberOfRuns,1);
    
   fprintf('picture %i\n', i);
   for run = 1:numberOfRuns 
       %fprintf('run %i\n', run);
        randomIndex = randperm(numberOfPictures,i);
        subX = X(:,randomIndex);
        subY = Y(:,randomIndex);
        [subAvg, ~] = findSmartAverage(subX,subY);
        
        
%         difference = subAvg - avg;
%         numerator = mag(difference);
%         denominator = mag(subAvg) + mag(avg);
%         
%         final = numerator ./ denominator;
        
        %figure(1);
        %    finalImage = reshape(final,460,320);

         %   imagesc(log(finalImage+.1));
    %hold on
    %    fixAxes();
    %    hold off
                
%         sumSquaredArray(run) = mean(final);
        results{run} = subAvg;
   end
   
   safeSave(results,i);
   %allResults{i} = sumSquaredArray;
   
   %disp(floor(sumSquaredArray(:,1:i)))
end

toc

