function int = NewCotes4(a, b, f)
    h = (b - a)/3;
    for i = 0:3
        x(i + 1) = a + i*h;
    end
    fx = feval(f, x);
    alfa(1) = 3*h/8;
    alfa(2) = 9*h/8;
    alfa(3) = 9*h/8;
    alfa(4) = 3*h/8;
    int = 0;
    for i = 1:4
        int = int + alfa(i)*fx(i);
    end
end
