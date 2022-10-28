function [lam0,it,z]=powerm(A,tol,maxit)
    [m,n]=size(A);
     
     if m ~= n , error('matrice non quadrata');end
     lam0=0;
     it=0;
     test=1;
     z=rand(n,1);
     z=z/norm(z);
     while test >= tol && it < maxit
         zita=A*z; % da verificare
         z=zita/norm(zita);
         lam1=z'*A*z;
         test=abs(lam1-lam0);
         lam0=lam1;
         it=it+1;
     end
end