% returns the accuracy of the model as a ratio (correctEstimates/totalRows)
function accuracy = calcAccuracy(yTest, softMaxMatrix)
    [r, garbo] = size(yTest);
    matchCount = 0;
    for i = 1:r
        [garbo ,estimate] = max(softMaxMatrix(i,:));
        estimate = estimate - 1;
        if estimate == yTest(i)
            matchCount = matchCount + 1;
        end
    end
    accuracy = (matchCount/r) ;
end
