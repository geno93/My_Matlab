function [s, s1, s2] = spline2(x, y, z)
       N = length(x);   % N = n + 1
       m = length(z);    % commentalo
       h = x(2) - x(1);  % lo posso fare perche ho nodi equidistanti
       for i = 1:N - 2
           mu(i) = 0.5;
       end
       mu(N - 1) = 0;
       lambda(1) = 0;
       for i = 2:N - 1
           lambda(i) = 0.5;
       end
       for i = 2:N - 1
           d(i) = 3*(y(i + 1) - 2*y(i) + y(i - 1))/(h^2);
       end
       d(1) = 0;
       d(N) = 0;
       for i = 1:N
          f(i) = 2;
       end
       M = modthomas(f, mu, lambda, d);
       for i = 2:N
           c(i - 1) = ((y(i) - y(i - 1))/h) - h*(M(i) - M(i - 1))/6;
           ct(i - 1) = y(i - 1) - M(i - 1)*(h^2)/6;
       end
       for j = 1:m   % commentalo
          for i = 2:N     
              if z(j) > x(i - 1) && z(j) < x(i)     % vedere se posso mettere z(i - 1)  
                    s(i - 1) = M(i - 1)*((x(i) - z(j))^3)/(6*h) + M(i)*((z(j) - x(i - 1))^3)/(6*h) + c(i - 1)*(z(j) - x(i - 1)) + ct(i - 1);
                   s1(i - 1) = - M(i - 1)*((x(i) - z(j))^2)/(2*h) + M(i)*((z(j) - x(i - 1))^2)/(2*h) + c(i - 1);
                   s2(i - 1) = M(i - 1)*(x(i) - z(j))/h + M(i)*(z(j) - x(i - 1))/h;
              end
          end
       end
end