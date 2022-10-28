function x = chebyshev(a, b, n)
    for i = 0:n 
        x(i + 1) = (a + b)/2 + (b - a)*cos((2*i + 1)*pi/(2*n + 2))/2;
    end
end
