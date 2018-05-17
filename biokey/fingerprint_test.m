clear all; clc; addpath(genpath(pwd));% addpath(.../fingerprintmatching);

%% EXTRACT FEATURES FROM AN ARBITRARY FINGERPRINT
filename='101_2.tif';
img = imread(filename);
if ndims(img) == 3; img = rgb2gray(img); end  % Color Images
disp(['Extracting features from ' filename ' ...']);
ffnew=ext_finger(img,1);

fingerprint_to_secure_sketch(ffnew);