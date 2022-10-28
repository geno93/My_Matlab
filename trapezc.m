function int = trapezc(a, b, m, f)
    h = (b - a)/m;
    x = [a:h:b];
    dim = max(size(x));
    y = feval(f, x);
    if length(y) == 1,
        y = ones(1, dim)*y;
    end
    int = h*(0.5*y(1) + sum(y(2:m)) + 0.5*y(m + 1));
end
