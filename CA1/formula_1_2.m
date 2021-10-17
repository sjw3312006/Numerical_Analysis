%CA_1 MACM 316
%Jeongwoon Suh (301313489)

%(a) changed form of the quadratic formula by rationalizing the numerator

%Using (1.1), (1.2) & (1.3) depending on conditions

function [round_x1, round_x2] = formula_1_2(a,b,c)

    d = b^2 - 4*a*c;
    
    if d > 0 && a ~= 0 %if (b^2 - 4*a*c) > 0 and a ~= 0 
        if b < 0 
            %Equation (1.2)
            x1 = -2*c / (b + sqrt(d));
            round_x1 = round(x1, 4, 'significant');
            %Equation (1.3)
            x2 = -2*c / (b - sqrt(d)); %if b is a negative number 
            round_x2 = round(x2, 4, 'significant');
        else
            %Equation (1.2)
            x1 = -2*c / (b + sqrt(d));
            round_x1 = round(x1, 4, 'significant');
            %Equation (1.1)
            x2 = (-b - sqrt(d))/(2*a); %if b is not a negative number 
            round_x2 = round(x2, 4, 'significant');
        end 
        
    elseif d == 0 && a ~= 0
        x1 = -b / (2*a);
        round_x1 = round(x1, 4, 'significant');
        x2 = NaN;
        
    else
        x1 = NaN;
        x2 = NaN;
    end
end