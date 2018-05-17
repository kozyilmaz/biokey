% Kazım Rıfat Özyılmaz
% 2016800027
% kazim.ozyilmaz@boun.edu.tr - kazim@monolytic.com
%
% Implementation of Secure Sketch Reproduction
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
%   s: secure sketch
%   x: random data
%   k: randomness size
% output:
%   R: hash result

function R = secure_sketch_reproduce(w, s, x, k)

% get dimensions of w, s, x
[m,n] = size(w);
[sm,sn] = size(s);
[xm,xn] = size(x);

% m should be 1
% n should be 2^x-1
% assert otherwise
assert(isequal(m,1));
mustBeInteger(log2(n+1));
% assert if dim's of s and x do not match
assert(isequal(sm,1));
assert(isequal(xm,1));
assert(isequal(n,sn));
assert(isequal(n,xn));

% r' = XOR(w',s)
r1 = xor(w,s);
% randomness = BCH decode r'
r2 = bchdec(gf(r1),n,k);
% r = BCH encode randomness
r3 = bchenc(r2,n,k);
% w = XOR(s,r)
Wclean = xor(s,r3.x);
% R = XOR(w,x)
R = xor(Wclean,x);

end
