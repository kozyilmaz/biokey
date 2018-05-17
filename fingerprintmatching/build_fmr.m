% GENERATING FMR AND FNMR DATA
%
% Usage:  build_fmr;
%
% Argument:   Nothing
%               

% Vahid. K. Alilou
% Department of Computer Engineering
% The University of Semnan
%
% July 2013

function  build_fmr( )
    load('db.mat'); P=72;
    fmr=zeros(100,P); fnmr=zeros(100,P);
    for p=1:P
        ffnew=ff{p};
        S=zeros(72,1);
        for i=1:72
            second=['10' num2str(fix((i-1)/8)+1) '_' num2str(mod(i-1,8)+1)];
            S(i)=match(ffnew,ff{i});
            fprintf(['\b\b' num2str(i)]);
        end
        gt=[1 2 3 4 5 6 7 8]+(fix((p-1)/8)*8); k=0;
        for a=0.01:.01:1
            k=k+1; s=0;
            g=find(S>a);
            for i=1:length(gt)
                s=s+sum(g==gt(i));
            end
            fmr(k,p)=(length(g)-s)/72;
            fnmr(k,p)=1-s/8;
        end
    end
    save('fmr.mat','fmr');
    save('fnmr.mat','fnmr');
end