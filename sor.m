function [x,iter,X]=sor(A,b,omega,nmax,tol)
    [n,m]=size(A);
    if n ~= m ,error('matrice non quadrata');end
    err=1;
    iter=0;
    x=zeros(n,1);
    X=[x];
    xnew=zeros(n,1);
    while err > tol && iter < nmax
        for I=1:n
            aux=A(I,1:I-1)*xnew(1:I-1)+A(I,I+1:n)*x(I+1:n);
            xnew(I)=omega*(b(I)-aux)/A(I,I)+(1-omega)*x(I);
        end
        err=norm(xnew-x);
        x=xnew;
     X=[X,x];
     iter=iter+1;
    end
    %X
    iter=iter-1;
end
     