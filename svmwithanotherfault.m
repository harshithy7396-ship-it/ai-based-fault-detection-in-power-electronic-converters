clc;
clear;
close all;

% ==============================
% Load Dataset
% ==============================
data = readtable("fault_dataset.csv");

X = data{:, {'Vavg','Vripple','Iavg','Iripple'}};
Y = categorical(data.Label);

% ==============================
% Train-Test Split
% ==============================
cv = cvpartition(Y, 'HoldOut', 0.2);

Xtrain = X(training(cv), :);
Ytrain = Y(training(cv));

Xtest  = X(test(cv), :);
Ytest  = Y(test(cv));

% ==============================
% Train SVM (Multi-class)
% ==============================
SVMmodel = fitcecoc(Xtrain, Ytrain);

% ==============================
% Prediction
% ==============================
Ypred = predict(SVMmodel, Xtest);

% ==============================
% Accuracy
% ==============================
accuracy = sum(Ypred == Ytest) / numel(Ytest) * 100;
fprintf("SVM Accuracy = %.2f%%\n", accuracy);

% ==============================
% Confusion Matrix
% ==============================
figure;
confusionchart(Ytest, Ypred);
title("SVM Confusion Matrix");