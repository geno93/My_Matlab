function [x1, y1] = eulmod(x, y, h, f)
    x1 = x + h;
    f1 = feval(f, x, y);
    y1 = y + feval(f, x + h/2, y + h*f1/2)*h;
end