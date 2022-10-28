function int = midpntc(a, b, m, f)
    h = (b - a)/m;
    x = [a + h/2:h:b];
    dim = max(size(x));
    y = feval(f, x);
    if length(y) == 1,
        y = ones(1, dim)*y;
    end
    int = h*sum(y);
end
