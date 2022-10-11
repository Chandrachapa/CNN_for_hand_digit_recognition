% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Introduction to Artificial Intelligence
% Unit 5 - Case Studies 
%
% Handwritten Digit Recognition
%
% MNIST Digit image dataset
% http://yann.lecun.com/exdb/mnist/
% 42000 Images (4200 of each digit)
% 8 bit gray scale
% Images 28x28
%
% MSc in Embedded Systems and IC Design / MSc in Wireless Communication
% Office of School of Postgraduate Studies & Research 
% Sri Lanka Technological Campus, Padukka
% Sri Lanka | SLTC | www.sltc.lk
% 
% SCorreia, August 2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Inicializes the IDE enviornement
clc;
clear all;
close all;

%% Loads the dataset
load MNIST_Train.mat
load MNIST_Validation.mat

% Builds the network
layers = [ ...
    imageInputLayer([28 28],'name','input')
    convolution2dLayer(5,20,'stride',2,'padding',1,'name','conv_1')
    batchNormalizationLayer('name','BN_1')
    reluLayer('name','Relu_1')
    maxPooling2dLayer(5,'stride',2,'name','maxPool_1')
    convolution2dLayer(5,20,'stride',2,'padding',1,'name','conv_2')
    batchNormalizationLayer('name','BN_2')
    reluLayer('name','Relu_2')
    fullyConnectedLayer(10,'name','FC')
    softmaxLayer('name','softmax')
    classificationLayer('name','output')
];

% Training options
options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',1, ...
    'Shuffle','every-epoch', ...
    'ValidationData',{img_V,labels_V}, ...
    'ValidationFrequency',10, ...
    'Verbose',false, ...
    'Plots','training-progress');

% Train then Netwok
net = trainNetwork(img_T,labels_T,layers,options);

% Saves the trained Netwok
save('net.mat','net');

