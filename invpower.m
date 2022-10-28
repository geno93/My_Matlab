function [lam0,it,z]=invpower(A,shift,tol,maxit)
    [m,n]=size(A);
     
     if m ~= n , error('matrice non quadrata');end
     lam0=0;
     it=0;
     test=1;
     B=(A-shift*eye(n));
     [L,U,P]=lu(B);
     z=rand(n,1);
     z=z/norm(z);
     while test >= tol && it < maxit
         y=forwardrow(L,P*z);
         zita=backwardrow(U,y);
         z=zita/norm(zita);
         lam1=z'*A*z;
         test=abs(lam1-lam0);
         lam0=lam1;
         it=it+1;
     end
end