function [x1, y1] = heun(x, y, h, f)
    x1 = x + h;
    f1 = feval(f, x, y);
    y1 = y + h*(f1 + feval(f, x1, y + h*f1))/2;
end