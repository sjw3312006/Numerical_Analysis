%CA_2 MACM 316
%Jeongwoon Suh (301313489)

%This jacobi_a.m file contains the part(a) where I have to write my own
%Jacobi code for solving the system with a general n with stopping
%criterion I(infinity) < TOL

function [x, rel_err] = jacobi_a(n, TOL, max_iter)

%To obatain the matrix in 14a of section 7.3: matrix A
for i = 1 : n-1
    for j = 1 : n-1
        if(i == j)
            A(i,j) = 1;
        elseif (i == j + 1)
            A(i,j) = -1/2;
        elseif (j == i + 1)
            A(i,j) = -1/2;
        end
    end
end


%To get the vector [P1,P2,....,Pn-1]^T as p 
for i = 1 : n - 1
    for j = 1
        if(i == j)
            P(i,j) = 1/2;
        else
            P(i,j) = 0;
        end
    end
end

% Extract the D - diagonal from A
D = diag(diag(A));
R = A - D;
x = zeros(n - 1, 1);
iter = 1;
rel_err = TOL * 2;

while (rel_err > TOL && iter <= max_iter)
    x_prev = x;
    x = inv(D)*(P - R * x_prev);
  
    rel_err = norm(x - x_prev, Inf)/norm(x, Inf);
   fprintf('\n Iteration %i: Relative error = %d ', iter, rel_err);
    
    iter = iter + 1;
end

fprintf('\n Jacobi function: x = [%f %f %f %f %f]\n Relative error = %d',...
    x, rel_err);

%To plot the approximation for x
plot(x)

end