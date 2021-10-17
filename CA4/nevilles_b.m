%Jeongwoon Suh
%301313489
%MACM 316 CA4
%part(b)

clc, clear, close all

% data points
xx = [ 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024] % years
y = [ 4929384, 5010476, 5090955, 5147712, 5305782.6667, 6293674.0003, 10387320.0015, 23079998.1166] % population
% n for (n + 1) nodes,
n = length(xx) - 1;
% interpolated points
x = 2025;

fprintf("length : %d\n", length(xx));

x_x = zeros(1, n+1); 
q = zeros(n+1, n+1);
for i = 0:n
     x_x(i+1) = xx(i+1);
     q(i+1, 1) = y(i+1);
end

% Neville Interpolation
d = zeros(1, n+1);
d(1) = x - x_x(1);

for i = 1:n
    d(i+1) = x - x_x(i+1);
    for j = 1:i
        q(i+1, j+1) = (d(i+1)*q(i, j)-d(i-j+1)*q(i+1, j)) / (d(i+1)-d(i-j+1));
    end
end

% list storing approximate values
list = [];

%  diplaying table for interpolation
fprintf('Table for interpolation evaluated at x = %0.4f: \n', n);
for i = 0:n
    fprintf("%d ", x_x(i+1));
    list(end+1) = q(i+1, 1);
    if i == n
        list(end+1) = q(n+1,n+1);
    end
    for j = 0:i
        fprintf("%f \t", q(i+1, j+1));
    end
    fprintf('\n');
end
disp(['From Table, Interpolated value at ' num2str(x) ' is equal to = ' num2str(q(end, end))])

xp = [1,2,3,4,5,6,7,8,9]; % years
fprintf("length : %d\n", length(xp));
fprintf("length : %d\n", length(list));
plot(xp,list,'o',xp,list,'-');
title('approximation vs n')
xlabel('n')
ylabel('approximate population')