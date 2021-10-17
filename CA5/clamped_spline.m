%Jeongwoon Suh
%301313489
%MACM 316 CA5

%Clamped Cubic Spline function

function [eq,S] = clamped_spline(inx,iny,h,f)
    format long;
    inx = inx: h: iny;
    iny = f(inx);
    syms x;
    f1 = eval(['@(x)' char(diff(f(x)))]);
    f2 = eval(['@(x)' char(diff(f1(x)))]);
    
    y_nat = iny;
    S = csape(inx,y_nat,'clamped',[f1(0), f1(1)]);
    n = [3 2 1];
    eq = [];
    for i=1:(length(inx)-1)
        f = (sym('x')-inx(i)).^n;
        fa = sum(S.coefs(i,1:3).*f)+S.coefs(i,4);
        eq = [eq; fa];
    end
end



