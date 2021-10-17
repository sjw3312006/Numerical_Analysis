% Jeongwoon Suh
% 301313489
% MACM 316 CA5

% For Part A
% natural cubic spline to approximate f(x) = e^−x by using the values given by 
% f (x) at x = 0,0.25,0.5,0.75,1.0.

% For Part B
% Repeat part A over the interval [0, 1] with equal node spacings h = 2−m, m = 3,4,5,6,7.

% For Part C
% Repeat parts A and B using clamped cubic splines.

clc;clear;

syms x;
f = @(x) exp(-x);
f1 = eval(['@(x)' char(diff(f(x)))]);
f2 = eval(['@(x)' char(diff(f1(x)))]);

h = 0.25;
inx = 0: h: 1;
iny = f(inx);

%% Natural Cubic Spline
[eq,S] = natural_spline(0,1,h,f);
indx = floor(0.5 / h) + 1;
g = matlabFunction(eq(indx));
g1 = eval(['@(x)' char(diff(g(x)))]);
g2 = eval(['@(x)' char(diff(g1(x)))]);

err_1 = norm(g1(0.5) - f1(0.5),inf);
err_2 = norm(g2(0.5) - f2(0.5),inf);

fprintf("approximated value of f'(0.5): %0.5e\n", g1(0.5));
fprintf("actual value of f'(0.5): %0.5e\n", f1(0.5));
fprintf("error of f'(0.5): %0.5e\n", err_1);

fprintf("approximated value of f'(0.5): %0.5e\n", g2(0.5));
fprintf("actual value of f'(0.5): %0.5e\n", f2(0.5));
fprintf("error of f''(0.5): %0.5e\n", err_2);

m  = [3, 4, 5, 6, 7];
err_1_list_n = [];
err_2_list_n = []; 
h_list = [];
for i = 1:size(m,2)
    h = 2^(-m(i));
    h_list = [h_list, h];
    eq = natural_spline(0,1,h,f);
    indx = floor(0.5 / h) + 1;
    g = matlabFunction(eq(indx));
    g1 = eval(['@(x)' char(diff(g(x)))]);
    g2 = eval(['@(x)' char(diff(g1(x)))]);
    err_1 = norm(g1(0.5) - f1(0.5),inf);
    err_2 = norm(g2(0.5) - f2(0.5),inf);
    err_1_list_n(end+1) = err_1;
    err_2_list_n(end+1) = err_2;
end

% figure(1);  
% plot(h_list,err_1_list_n);
% xlabel('h') ;
% ylabel('abs(error)');
% title("f'(0.5): m vs abs(error)");
% ytickformat('%.1f')

% 
% figure(2);
% plot(h_list, err_2_list_n);
% xlabel('h') ;
% ylabel('abs(error)');
% title("f''(0.5): h vs abs(error)");
% ytickformat('%.1f')

%% Clamped Cubic Spline
h = 0.25;
[eq,S] = clamped_spline(0,1,h,f);
indx = floor(0.5 / h) + 1;
g = matlabFunction(eq(indx));
g1 = eval(['@(x)' char(diff(g(x)))]);
g2 = eval(['@(x)' char(diff(g1(x)))]);
err_1 = norm(g1(0.5) - f1(0.5),inf);
err_2 = norm(g2(0.5) - f2(0.5),inf);

fprintf("approximated value of f'(0.5): %0.5e\n", g1(0.5));
fprintf("actual value of f'(0.5): %0.5e\n", f1(0.5));
fprintf("error of f'(0.5): %0.5e\n", err_1);

fprintf("approximated value of f'(0.5): %0.5e\n", g2(0.5));
fprintf("actual value of f'(0.5): %0.5e\n", f2(0.5));
fprintf("error of f''(0.5): %0.5e\n", err_2);

m  = [3, 4, 5, 6, 7];
err_1_list_c = [];
err_2_list_c = []; 
h_list = [];

for i = 1:size(m,2)
    h = 2^(-m(i));
    h_list = [h_list, h];
    eq = clamped_spline(0,1,h,f);
    indx = floor(0.5 / h) + 1;
    g = matlabFunction(eq(indx));
    g1 = eval(['@(x)' char(diff(g(x)))]);
    g2 = eval(['@(x)' char(diff(g1(x)))]);
    err_1 = norm(g1(0.5) - f1(0.5),inf);
    err_2 = norm(g2(0.5) - f2(0.5),inf);
    err_1_list_c(end+1) = err_1;
    err_2_list_c(end+1) = err_2;
end
% 
figure(3);  
plot(h_list,err_1_list_c);
xlabel('h') ;
ylabel('abs(error)');
title("f'(0.5): h vs abs(error)");
ytickformat('%.1f')
% 
% figure(4);
% plot(h_list,err_2_list_c);
% xlabel('h') ;
% ylabel('abs(error)');
% title("f''(0.5): h vs abs(error)");
% ytickformat('%.1f')


%% Clear
clearvars -except err_1_list_n err_2_list_n err_1_list_c err_2_list_c





