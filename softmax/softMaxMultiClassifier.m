% clear all
% SAMIN BIN KARIM
% 1720049
load mnist_train     

imgColms = 10000;
numClass = 10; % 0:9
digits = digits(:, 1:imgColms)'; 
labels = labels(:, 1:imgColms)'; 

% permutate the data rows and respective labels
% with same random vector
[r, c] = size(digits);
randoms = randperm(r,r)'; %random reshuffling of the data

digits = digits(randoms, :);
labels = labels(randoms, :);

%take the 80% of data as training data and store it in ATrain and the same part of the labels and store in yTrain
trainRow = int32(0.8*r);
ATrain = digits(1:trainRow, :);
yTrain = labels(1:trainRow, :);

%put the remaining as test Data and store it in ATest and the labels in yTest
ATest = digits(trainRow+1:r, :);
yTest = labels(trainRow+1:r, :);

% multiply Atest * coefMatrix to get final matrix
% make normalise method to softmax each row 
coefMatrix = estimateCoefMtrx(ATrain, yTrain);
finalScore = ATest*coefMatrix;
% softmax to get probabilities
softMaxMatrix = softMaxFunction(finalScore);
% calculate accuracy of estimates
accuracy = calcAccuracy(yTest, softMaxMatrix);
accuracy
% generally around 83 for 80000 data%



