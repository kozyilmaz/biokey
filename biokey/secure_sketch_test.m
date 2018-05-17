clear all; clc; addpath(genpath(pwd));

for i = 1:100
    % biometric data size (must be 2^x-1)
    n = 127;
    % additional randomness size
    k = 50;

    % biometric input (random for test)
    Wclean = randi([0 1],1,n);

    % generate secure sketch and hash, return P (x,s) and R
    [s, x, Rgen] = secure_sketch_generate(Wclean,k);

    % get tolerable error count
    t = bchnumerr(n,k);
    % inject max tolerable error
    Wnoisy = Wclean + randerr(1,n,t);

    % create hash with noisy w
    Rrep = secure_sketch_reproduce(Wnoisy,s,x,k);

    % assert if unable to reproduce the hash value
    assert(isequal(Rgen,Rrep))

    %save('SS.mat', 'Wclean', 'Wnoisy', 'k', 'x', 's', 't', 'Rgen', 'Rrep');
end

disp('Secure Sketch Test Success');
