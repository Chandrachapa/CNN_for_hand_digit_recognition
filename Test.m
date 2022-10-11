% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Introduction to Artificial Intelligence
% Unit 5 - Case Studies 
%
% Handwrite Digit Recognition
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

% Inicializes the IDE enviornement
clear
clc
close all

% Loads the previously trained network
load("net.mat");

% Load the validation dataset
load MNIST_Validation.mat

%% Classification and Evaluation

% Classifies the whole dataset
labels_P = classify(net,img_V);

% Accuracy calculation
Acc = sum(labels_P==labels_V)/length(labels_P);

% Calculates the Confusion Matrix
cm = confusionchart(labels_V,labels_P);
cm.Title = 'Using Validation Data';
cm.RowSummary = 'row-normalized';
cm.ColumnSummary = 'column-normalized';
