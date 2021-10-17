%Jeongwoon Suh
%301313489
%MACM 316 CA4

% n for (n + 1) nodes,
x = 8;
% data points
xx = [1 2 3 4 6 7 8 9 10];
y = [4502104; 4566769; 4630077; 4707103; 4859250; 4929384; 5010476; 5090955; 5147712];
% interpolated points
n = 4.5;

% Neville Interpolation
d = zeros(1, x+1);
d(1) = n - xx(1);
 for i = 1 : x
    d(i + 1) = n - xx(i + 1);
    for j = 1 : i
       y(i+1, j+1) = (d(i+1) * y(i, j)- d(i-j+1) * y(i+1, j))/(d(i+1)-d(i-j+1));
    end
end
 
%  list for storing approximate values
list = [];

%  diplaying table for interpolation
fprintf('Table for interpolation evaluated at x = %0.4f: \n', n);
for i = 0 : x
    fprintf('%2.4f ', xx(i+1));
    list(end + 1) = y(i+1, 1);
    if i == 3
        list(end + 1) = y(x + 1,x + 1);
    end
    for j = 0 : i
       fprintf('%0.4f ', y(i + 1,j + 1));
    end
    fprintf('\n');
end
fprintf("Using Neville's Interpolation, the approximate value for x = n = 4.5 is %.4f\n", y(x+1,x+1));

% plotting approximation vs n plot
xp = [1,2,3,4,5,6,7,8,9,10];
plot(xp,list,'o',xp,list,'-');
title('approximation vs n')
xlabel('n');
ylabel('approximation population');