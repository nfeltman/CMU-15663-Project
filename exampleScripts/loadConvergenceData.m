load('/Users/alimpaecher/Downloads/1-20x100.mat');
sumSquaredArray(isnan(sumSquaredArray)) = .35;
ssa_1_20 = sumSquaredArray;

load('/Users/alimpaecher/Downloads/21-50x20.mat');
ssa_21_50 = sumSquaredArray;

load('/Users/alimpaecher/Downloads/51-100x10.mat');
ssa_51_100 = sumSquaredArray;

load('/Users/alimpaecher/Downloads/100-131x3.mat');
ssa_101_131 = sumSquaredArray;

ssaMean(1:20) = mean(ssa_1_20(:,1:20));
ssaMean(21:50) = mean(ssa_21_50(:,21:50));
ssaMean(51:100) = mean(ssa_51_100(:,51:100));
ssaMean(101:131) = mean(ssa_101_131(:,101:131));

ssaVar(101:131) = var(ssa_101_131(:,101:131));
ssaVar(1:20) = var(ssa_1_20(:,1:20));
ssaVar(21:50) = var(ssa_21_50(:,21:50));
ssaVar(21:50) = var(ssa_21_50(:,21:50));

sumSquaredArray = ssa_1_20;
sumSquaredArray(1:size(ssa_21_50),21:50) = ssa_21_50(:,21:50);
sumSquaredArray(1:size(ssa_51_100),51:100) = ssa_51_100(:,51:100);
sumSquaredArray(1:size(ssa_101_131),101:131) = ssa_101_131(:,101:131);