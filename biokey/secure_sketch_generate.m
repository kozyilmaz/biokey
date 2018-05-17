% Kazım Rıfat Özyılmaz
% 2016800027
% kazim.ozyilmaz@boun.edu.tr - kazim@monolytic.com
%
% Implementation of Secure Sketch Generation
%
% Dodis, Yevgeniy, Leonid Reyzin, and Adam Smith.
% "Fuzzy extractors: How to generate strong keys from biometrics and other noisy data."
% In International conference on the theory and applications of cryptographic techniques,
% pp. 523-540. Springer, Berlin, Heidelberg, 2004.
%
% Kang, Hyunho, Yohei Hori, Toshihiro Katashita, and Manabu Hagiwara. 
% "The Implementation of Fuzzy Extractor is Not Hard to Do: An Approach Using PUF Data."
% In Proceedings of the 30th Symposium on Cryptography and Information Security 
% Kyoto, Japan, pp. 22-25. 2013.
%
% input:
%   w: biometric data
%   k: randomness size
% output:
%   x: random data
%   s: secure sketch
%   R: hash result

function [s, x, R] = secure_sketch_generate(w, k)

% get dimension of w
[m,n] = size(w);

% m should be 1
% n should be 2^x-1
% assert otherwise
assert(isequal(m,1));
mustBeInteger(log2(n+1));

% create randomness x with the same size as w
x = randi([0 1],1,n);

% actually this is R = SHA256(xor(x,w)) but we use the XOR right now
% SHA256 is an additional randomness step for protection
R = xor(x,w);

% message size picked for RNG1
k = 50;
RNG1 = randi([0 1],1,k);
% BCH encode requires Galois fields GF(2)
r = bchenc(gf(RNG1),n,k);
s = xor(w,r.x);

end
