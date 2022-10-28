function [x,iter,X]=jacobi(A,b,nmax,tol)
    [m,n]=size(A);
    if m~=n , error('matrice non quadrata');end
    %for I=1:n
     %   y(I)=0;
     %   for J=1:n 
      %     if I~=J
       %      y(I)=y(I)+abs(A(I,J));
        %    end
       % if abs(A(I,I)) < y(I) , error('matrice non s d d');end
    %end
    iter=0;
    x=zeros(n,1);
    r=b-A*x;
    err=norm(r); %criterio del residuo
    nb=norm(b);
    tol=tol*nb;
    xnew=zeros(n,1);
    z=zeros(n,1);
    X=[x];
    while err > tol && iter < nmax
   
        for I=1:n
          % for J=1:n
           %    if I~=J
            %        z(I)=z(I)+A(I,J)*x(J); % calcolo della sommatoria A(I,J) con I diverso da J
             %  end
           %end
          xnew(I)=(b(I)-(A(I,1:I-1)*x(1:I-1)+A(I,I+1:n)*x(I+1:n)))/A(I,I);  % calcolo delle nuove x
          x=xnew; 
          r=b-A*x; 
          err=norm(r); 
          iter=iter+1;
           X=[X,x];
        end
    end
    %X
    iter=iter-1;
end
               