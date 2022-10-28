function herm = hermpol(x, y, dy, z)
    n = max(size(x));
    m = max(size(z));
    herm = [];
    for j = 1:m
        xx = z(j);  
        hxv = 0;
        for i = 1:n
            den = 1;
            num = 1;
            xn = x(i);
            derLi = 0;
            for k = 1:n
                if k ~= i, 
                    num = num*(xx - x(k));  % numeratore dei polinomi caratteristici di Lagrange
                    arg = xn - x(k);     % x(i) - x(k) 
                    den = den*arg;       % denominatore dei polinomi caratteristici di Lagrange
                    derLi = derLi + 1/arg;  % calcolo di (li)' calcolato in x(i)
                end
            end
            Lix2 = (num/den)^2;     % (li)^2 calcolato in z(j)
            p = (1 - 2*(xx - xn)*derLi)*Lix2;   % calcolo di (Ai) calcolato in z(j)
            q = (xx - xn)*Lix2;       % calcolo di (Bi) calcolato in z(j)
            hxv = hxv + (y(i)*p + dy(i)*q);   % calcolo del polinomio osculatore (interpolatore di Hermite)
        end
        herm = [herm, hxv];
    end
end