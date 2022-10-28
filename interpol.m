function f = interpol (x, y, z)   
	[m, n] = size(y);
	for j = 1:m
		a(:,1) = y(j,:);   
		for i = 2:n
			a(i:n,i) = (a(i:n,i - 1) - a(i - 1, i - 1))./(x(i:n) - x(i - 1))';  %calcolo dei coefficenti tramite diff divise adattate
        end                                                                  
		f(j,:) = a(n,n).*(z - x(n - 1)) + a(n - 1, n - 1);       % Horner
		for i = 2:n - 1
			f(j,:) = f(j,:) .*(z - x(n - i)) + a(n - i, n - i);    % Horner
		end
	end
