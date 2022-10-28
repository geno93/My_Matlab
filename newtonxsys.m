function [x, iter,xdif] = newtonxsys (F, J, x, tol, nmax, p)
	Jx = feval(J, x);
	[L, U, P] = lu(Jx);
	err = tol + 1;
    xdif = [];  %se non serve commentalo
	iter = 0;
 	step = 0;
	while err > tol  &  iter < nmax
		Fx = feval(F, x);
		if step == p
		   Jx = feval(J, x);
		   [L, U, P] = lu(Jx);
		   step = 0;
		end
		y = forwardrow(L, -P*Fx);
		delta = backwardrow(U, y);
		x = x + delta;
		err = norm(delta);
        xdif = [xdif; err];  % commentalo
		iter = iter + 1;
		step = step + 1;
    end
    iter = iter -1;
end