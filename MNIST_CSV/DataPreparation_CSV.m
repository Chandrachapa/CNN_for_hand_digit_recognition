% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Introduction to Artificial Intelligence
% Unit 5 - Case Studies 
%
% Handwrite Digit Recognition
%
% MNIST Digit image dataset
% http://yann.lecun.com/exdb/mnist/
% 60.000 Training Images (6.000 of each digit)
% 10.000 Training Images (1.000 of each digit)
% 8 bit gray scale
% Images Resolution = 28x28
%
% MSc in Embedded Systems and IC Design / MSc in Wireless Communication
% Office of School of Postgraduate Studies & Research 
% Sri Lanka Technological Campus, Padukka
% Sri Lanka | SLTC | www.sltc.lk
% 
% SCorreia, August 2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Inicializes the IDE enviornement
clc
clear
close all

%% Loads and processes the  dataset

% Read the CSV file, ignoring the first column and line (labels)
MNIST_Train = csvread("MNIST_CSV\mnist_train.csv",0,0);
MNIST_Validation = csvread("MNIST_CSV\mnist_test.csv",0,0);

% Divides images and labels
labels_T = MNIST_Train(:,1);
images_T = MNIST_Train(:,2:785);
clear MNIST_Train;

labels_V = MNIST_Validation(:,1);
images_V = MNIST_Validation(:,2:785);
clear MNIST_Validation;

% Scales and orders the images pixels
for i=1:60000
    img_T(:,:,i) = permute(reshape(images_T(i,:)',28,28)/255,[2 1]);
end
for i=1:10000
    img_V(:,:,i) = permute(reshape(images_V(i,:)',28,28)/255,[2 1]);
end

% Shows 40.000 images
figure
montage(img_T(:,:,1:100))
figure
montage(img_T(:,:,1:60000))

%% Saves a MAT file for further processing
% Adds the channel dimention
img_T = reshape(img_T,[28,28,1,60000]);
img_V = reshape(img_V,[28,28,1,10000]);

% Transforms to the correct type for classification
labels_T = categorical(labels_T);
labels_V = categorical(labels_V);

save 'MNIST_Train.mat' img_T labels_T
save 'MNIST_Validation.mat' img_V labels_V
