meanResults = zeros(size(allResults));

for index = 1:size(allResults,1)
    results = allResults{index};
    results = results(isfinite(results(:, 1)), :);
    meanResults(index) = mean(results);
end