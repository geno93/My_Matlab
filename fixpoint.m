function [xvet, xdif, fx, it] = fixpoint (x, tol, nmax, fun, phi, k)
	if nargin == 6, tol = tol * (1 - k)/k;end      % se numero argomenti in input
	xvet = x;
	xdif = [];
	fx = feval(fun, x);
	it = 0;
	err = tol + 1;
	while it < nmax  &&  err > tol
		xn = feval(phi, x);
		xvet = [xvet; xn];
		err = abs(xn - x);
		fx = [fx; feval(fun, xn)];
		xdif = [xdif; err];
		x = xn;
		it = it + 1;
end