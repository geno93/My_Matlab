function d = dividif(x, y)
	n = length(y);
	d = zeros (n, n);
	d(:,1) = y;   
	for j = 2:n 
		for i = j:n   %potrei fare un unico ciclo
			d(i,j) = (d(i - 1, j - 1) - d(i, j - 1))/(x(i - j + 1) - x (i));  %diff divise
		end
	end
