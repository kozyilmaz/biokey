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

function fingerprint_to_secure_sketch(minutiae)

% Secure Sketch bit size and distance sample size
bit_size = 127;
sample_size = 5;
ceiling = 0;

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

tmpv = [];
for j = 1:size(dist,1)
    tmph = [];
    for k = 1:sample_size
        % convert decimal distances to binary 16-bit arrays
        % then concatenate them to form the key pattern 'w'
        tmph = horzcat(tmph, de2bi(dist(j,k),16));
    end
    % padding with zeros
    tmph = horzcat(tmph, zeros(1, bit_size - (sample_size * 16)));
    % create distance values per bifurcation point
    tmpv = vertcat(tmpv, tmph);
end

minutiaedistances = tmpv;
    
    
load('securesketches.mat');
% sanity test
%isequal(minutiaedistances,dd{1})
    
    for i = 1:size(ss,2)
        s = ss{i};
        x = xx{i};
        R = RR{i};
        save('z.mat', 'minutiaedistances', 's', 'x', 'R');
    
        hit = 0;
        for j = 1:size(minutiaedistances,1)
            for k = 1:size(s,1)
                % create hash values (which is the key) and compare them
                % with stored values. if we hit we got a match
                Rtest = secure_sketch_reproduce(minutiaedistances(j,:),s(k,:),x(k,:),50);
                if (isequal(R(k,:),Rtest))
                    hit = hit + 1;
                end
            end
        end
        str = ['10' num2str(fix((i-1)/8)+1) '_' num2str(mod(i-1,8)+1) '.tif (', num2str(hit), '/', num2str(k), ')'];
        disp(str);
    end
   


end