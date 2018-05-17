% PLOT DATA
%
% Usage:  plot_data( X,y );
%
% Argument:   X -  Data Points
%             y -  Plot Style (1 for blue, 2 for red, ...)

% Vahid. K. Alilou
% Department of Computer Engineering
% The University of Semnan
%
% July 2013

function plot_data( X,y )
    N=size(X,1); r=15;
    hold on; axis equal;
    pale={'b+' 'r.' 'g.' 'y.' 'm.' 'c.'};
    color={'b' 'r' 'g' 'y' 'm' 'c'};
    for i=1:N
        plot(X(i,1),X(i,2),pale{y});
        MyX=[X(i,1) X(i,1)+r*cos(X(i,3))];
        MyY=[X(i,2) X(i,2)+r*sin(X(i,3))];
        plot(MyX,MyY,color{y});
    end
    hold off;
end

