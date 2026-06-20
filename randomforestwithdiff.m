clc;
clear;
close all;

% ==============================
% 1) Load Dataset
% ==============================
data = readtable("fault_dataset.csv");

X = data{:, {'Vavg','Vripple','Iavg','Iripple'}};
Y = categorical(data.Label);

% ==============================
% 2) Train-Test Split (80/20)
% ==============================
cv = cvpartition(Y, 'HoldOut', 0.2);

Xtrain = X(training(cv), :);
Ytrain = Y(training(cv));

Xtest  = X(test(cv), :);
Ytest  = Y(test(cv));

% ==============================
% 3) Train Random Forest
% ==============================
numTrees = 100;

RFmodel = TreeBagger(numTrees, Xtrain, Ytrain, ...
    'Method','classification', ...
    'OOBPrediction','On');

% ==============================
% 4) Prediction
% ==============================
Ypred = predict(RFmodel, Xtest);
Ypred = categorical(Ypred);

% ==============================
% 5) Accuracy
% ==============================
accuracy = sum(Ypred == Ytest) / numel(Ytest) * 100;
fprintf("Random Forest Accuracy = %.2f%%\n", accuracy);

% ==============================
% 6) Confusion Matrix
% ==============================
figure;
confusionchart(Ytest, Ypred);
title("Random Forest Confusion Matrix");

% ==============================
% 7) Feature Importance
% ==============================
figure;
bar(RFmodel.OOBPermutedPredictorDeltaError);
xticklabels({'Vavg','Vripple','Iavg','Iripple'});
xlabel("Features");
ylabel("Importance");
title("Feature Importance (Random Forest)");