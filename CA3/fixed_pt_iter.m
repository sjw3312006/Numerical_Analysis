%Jeongwoon Suh (301313489)
%MACM 316 CA 3

function fixed_pt_iter

i = 0;
p_0 = 1;
TOL = 10^-2;
n = 80; %n could possible be changed based on the number of iterations

%Part A : Question 6 in Exercise Set 2.2

%For (a):
g = @(x) x * (1 + (7 - x^5)/(x^2))^3;
%For (b):
% g = @(x) x - x^3 -4*x^2 + 10;
%For (c):
% g = @(x) x - (x^5 -7)/(5*x^4);
%For (d):
% g = @(x) x - (x^5 - 7 ) / 12;
 

figure;
while i <= n
    p = g(p_0);
    abs_error = abs(p - p_0);
    fprintf('absolute_error %f \n', double(abs_error));
    if abs_error < TOL
        fprintf('solution is %f  after %d\n', double(p), i)
        fprintf('absolute_error %f \n', double(abs_error));
        break
    end
    i = i + 1;
    fprintf(" iteration %d : solution = %f\n", i, double(p));
    p_0 = p;
end

end
