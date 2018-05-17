% Kazım Rıfat Özyılmaz
% 2016800027
% kazim.ozyilmaz@boun.edu.tr - kazim@monolytic.com
%
% Creating Secure Sketches from Fingerprint Minutiae Data
%
% output:
%   x: random data
%   s: secure sketch
%   R: hash result

function [a, b, c] = minutiae_to_secure_sketch(d)

% load extracted minutiae data from FVC2002 database
load('db.mat');

for i = 1:72
    minutiae = ff{i};
    
    % m is the number of minutiae points
    % n is the feature set (xcoor, ycoor, minutiae type, theta etc.)
    [m,n] = size(minutiae);

    % 1 is 'Ridge ending point'
    save('data.mat', 'minutiae');

end


end