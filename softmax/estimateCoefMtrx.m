%  estimates coefficient Matrix for 10 binary classifiers
%  from given (nXm)Atrain data and (nX1) ytrain results 0:9
function [coefMatrix] = estimateCoefMtrx(Atrain, yTrain)
    [r,c] = size(yTrain);
    yMatrix = []; % will populate with sign(y)s
    for i = 0:9
        newY = ones(r, c)*-1;
        positiveIndx = (find( yTrain == i ));
        if ~isempty(positiveIndx)
            newY(positiveIndx, :) = 1;
        end
        yMatrix = [yMatrix newY];
    end  
    coefMatrix = pinv(Atrain)*yMatrix;
end
