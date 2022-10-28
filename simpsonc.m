function int = simpsonc(a, b, m, f)
    h = (b - a)/m;
    x = [a:h/2:b];
    dim = max(size(x));
    y = feval(f, x);
    if length(y) == 1,
        y = ones(1, dim)*y;
    end
    int = (h/6)*(y(1) + 2*sum(y(3:2:2*m - 1)) + 4*sum(y(2:2:2*m)) + y(2*m + 1));
end
