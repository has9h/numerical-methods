clear all
load mnist_train                       
digits = digits(:, 1:10000)'; 
labels = labels(:, 1:10000)'; 

data = [(1:10000)' digits  labels];
[r c] = size(data );
randoms = randperm(r,r)'; %random reshuffling of the data


%take the 80% of data as training data and store it in ATrain and the same part of the labels and store in yTrain
%write your code here




%put the remaining as test Data and store it in ATest and the labels in yTest
%write your code here





%train 10 different 1-vs-all linear classifiers 
%run each of them on the test data in ATest
%store the scores for each classifier on the test data in FinalScore matrix

FinalScore=[]; 

for digit = 0:9
        
		% put +1 in the ytrain if it matches with digit, otherwise put -1
		%write your code here
        
			
        
        pseudo = pinv(ATrain); %Find pseudo-inverse
        coeffs = pseudo*yTrain;  % Estimated Coefficients
        
        %compute the score for this classifier for the test data in ATest
		Score = Atest*coeffs;
		
		%store the scores for each classifier in FinalScore matrix
        FinalScore = [FinalScore , Score]; 
      
end;

[rT  cT] = size(FinalScore);

%compute the softmax probabilities and the the accuracy of the classifiers 
%write your code here


