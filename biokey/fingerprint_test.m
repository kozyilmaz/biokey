clear all; clc; addpath(genpath(pwd),'../fingerprintmatching');

% extract features from fingerprint (minutiae) and create secure sketches
% then create and compare hash values using stored secure sketches
filename='101_1.tif';
img = imread(filename);
if ndims(img) == 3; img = rgb2gray(img); end  % Color Images
disp(['Extracting features from ' filename ' ...']);
fingerprint=ext_finger(img,1);
fingerprint_to_secure_sketch(fingerprint);