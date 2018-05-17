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

function minutiae_to_secure_sketch(b)

% sample size
sample_size = 5;
ceiling = 0;

% load extracted minutiae data from FVC2002 database
load('db.mat');

% traverse through extracted minutiae data and calculate bifurcation point
% distances
for i = 1:size(ff,2)
    
    % minutiae data per finger 
    minutiae = ff{i};
    
    % m is the total number of minutiae points
    % n is the feature set size (xcoor, ycoor, CN, theta etc.)
    [point_count,feature_count] = size(minutiae);

    % Properties of the Crossing Number.
    % 0 - Isolated point
    % 1 - Ridge ending point
    % 2 - Continuing ridge point
    % 3 - Bifurcation point
    % 4 - Crossing point
    bifurcation = minutiae(minutiae(:,3)==3,1:2); % isolate bifurcation and x,y
    ridgeending = minutiae(minutiae(:,3)==1,1:2); % isolate ridge ending  and x,y

    % Euclidian distances of Ridge endings to each Bifurcation point
    euclidian = dist2(bifurcation(:,1:2), ridgeending(:,1:2));
    % get only the smallest 'sample_size' elements
    dist = mink(euclidian,sample_size,2);
   
    % just checking for ultimate maximum values
    if (max(dist(:)) > ceiling)
        ceiling = max(dist(:));
    end
    
    tmpv = [];
    for j = 1:size(dist,1)
        tmph = [];
        for k = 1:sample_size
            % convert decimal distances to binary 16-bit arrays
            % then concatenate them to form the key pattern 'w' 
            tmph = horzcat(tmph, de2bi(dist(j,k),16));
        end
        % padding with zeros
        tmph = horzcat(tmph, zeros(1, b - (sample_size * 16)));
        % create distance values per bifurcation point
        tmpv = vertcat(tmpv, tmph);
    end
    
    % minimal 'sample_size' distance values per finger print 
    dd{i} = tmpv;

    %save('data.mat', 'minutiae', 'i', 'j', 'k', 'bifurcation', 'ridgeending', 'euclidian', 'dist', 'ceiling', 'tmph', 'tmpv');
end

% calculate secure sketch data for distance sets
for i = 1:size(dd,2)
    % minutiae distances per bifurcation point 
    minutiaedistances = dd{i};
    
    s = [];
    x = [];
    R = [];
    for j = 1:size(minutiaedistances,1)
        % create a secure sketch, randomness and hash for every
        % bifurcation distance set
        [tmps, tmpx, tmpR] = secure_sketch_generate(minutiaedistances(j,:),50);
        s = vertcat(s, tmps);
        x = vertcat(x, tmpx);
        R = vertcat(R, tmpR);
    end
    % finally secure sketch set for comparison database is created
    % this is a randomized secure set so even compromised it cant be
    % used directly
    ss{i} = s;
    xx{i} = x;
    RR{i} = R;
    save('securesketches.mat', 'dd', 'ss', 'xx', 'RR');
end

end