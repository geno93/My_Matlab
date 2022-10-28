function [x1, y1, it] = eulimp(x, y, h, f, jac, tol, itmax)
    x1 = x + h;
    y1 = y;
    err = tol + 1;
    it = 0;
    while err > tol && it < itmax
        f_new = y1 - y - h*feval(f, x1, y1);
        df_new = eye(length(y)) - h*feval(jac, x1, y1);
        delta = df_new\f_new;
        y1 = y1 - delta;
        err = norm(delta);
        it = it + 1;
    end
end