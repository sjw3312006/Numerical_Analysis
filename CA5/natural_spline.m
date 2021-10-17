%Jeongwoon Suh
%301313489
%MACM 316 CA5

%Natural Cubic Spline function

function [eq, S] = natural_spline(inx, iny, h, f)
    format long;
    inx = inx: h: iny;
    iny = f(inx);
    syms x;
 
    y_nat = iny;
    S = csape(inx, y_nat, 'second');
    n = [3 2 1];
    eq = [];
    for i = 1:(length(inx) - 1)
        f = (sym('x') - inx(i)).^n;
        fa = sum(S.coefs(i, 1:3).*f) + S.coefs(i,4);
        eq = [eq; fa];
    end
end



