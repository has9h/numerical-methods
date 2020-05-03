% runs softmax function on the entire final score matrix
%  turning it into a probability estimating matrix for Atest data
function softMaxMatrix = softMaxFunction(finalScore) 
    [r, c] = size(finalScore);
    tempSoftMaxMatrix = zeros(r,c);
    for myClass = 1:c
        for row = 1:r
            currY = exp(finalScore(row, myClass));
            mySum = 0;
            % sum of entire row
            for column = 1:c
                mySum = mySum + exp(finalScore(row,column));
            end
            currY  = currY/mySum;
            tempSoftMaxMatrix(row, myClass) = currY;
        end
    end
    softMaxMatrix = tempSoftMaxMatrix;
end