%CA_1 MACM 316
%Jeongwoon Suh (301313489)

%(a) general quadratic eq: ax^2 + bx + c = 0, a ~= 0
%    using four-digit-arithmetic & the most accurate approx. formula

%    (1.1)

function [round_x1, round_x2] = formula_1_1 (a,b,c)

    d = b^2 - 4*a*c;
    
    if d > 0 && a ~= 0 %if (b^2 - 4*a*c) > 0 and a ~= 0 
        x1 = (-b + sqrt(d))/(2*a);
        round_x1 = round(x1, 4, 'significant');
        x2 = (-b - sqrt(d))/(2*a);
        round_x2 = round(x2, 4, 'significant');
        
    elseif d == 0 %if (b^2 - 4*a*c) = 0
        x1 = -b / (2*a);
        round_x1 = round(x1, 4, 'significant');
        x2 = NaN;
        
    else %if (b^2 - 4*a*c) < 0
        x1 = NaN;
        x2 = NaN;
    end
end
        
%[x1, x2] = formula_1_1(1, - sqrt(7), sqrt(2))
        
       