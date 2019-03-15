%%
clear all;
close all;
clc;

%%
addpath('utilities');
fprintf(['==> Note that high score value indicates more blurriness in input image \n']);

%% Load image and covnert to grayscale image with single values
sharp_img = imread('data\sharp_image.jpg');
blurry_img = imread('data\blurry_image.jpg');

%%  transfer images into grayscale
sharp_image = im2double(rgb2gray(sharp_img));
blurry_image = im2double(rgb2gray(blurry_img));

%% Load kernel and identify image blur type
addpath('utilities')
load('HVS_MaxPol_kernel.mat');
params_HVS_MaxPol.kernel_sheets = selected_sheets;
params_HVS_MaxPol.type = 'natural'; % 'synthetic'

%% NR-ISA Score on in-focus/out-of-focus image by HVS-MaxPol-1
params_HVS_MaxPol.numKernel = 1; % identify the number of kernels used
score_sharp1 = HVS_MaxPol(sharp_image, params_HVS_MaxPol);
fprintf(['NR-ISA score sharp image by HVS-MaxPol-1 = ', num2str(score_sharp1), '\n']);
score_blurry1 = HVS_MaxPol(blurry_image, params_HVS_MaxPol);
fprintf(['NR-ISA score blurry image by HVS-MaxPol-1 = ', num2str(score_blurry1), '\n']);

%% NR-ISA Score on in-focus/out-of-focus image by HVS-MaxPol-2
params_HVS_MaxPol.numKernel = 2; % identify the number of kernels used
score_sharp2 = HVS_MaxPol(sharp_image, params_HVS_MaxPol);
fprintf(['NR-ISA score for sharp image by HVS-MaxPol-2 = ', num2str(score_sharp2), '\n']);
score_blurry2 = HVS_MaxPol(blurry_image, params_HVS_MaxPol);
fprintf(['NR-ISA score for blurry image by HVS-MaxPol-2 = ', num2str(score_blurry2), '\n']);

%% demonstrate the sample images and the NR-ISA scores
figure('rend','painters','pos', [200 , 50, 1000, 600]);
% HVS-MaxPol
subplot(1,2,1)
imshow(sharp_img)
title(['NR-ISA: HVS-MaxPol-1 = ', num2str(score_sharp1), ...
    ', HVS-MaxPol-2 = ', num2str(score_sharp2)])
subplot(1,2,2)
imshow(blurry_img)
title(['NR-ISA: HVS-MaxPol-1 = ', num2str(score_blurry1), ...
    ', HVS-MaxPol-2 = ', num2str(score_blurry2)])