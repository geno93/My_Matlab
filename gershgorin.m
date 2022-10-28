function gershgorin(A)
    [m,n]=size(A);
     
     if m ~= n , error('matrice non quadrata');end
     for I=1:n
         h=real(A(I,I));
         k=imag(A(I,I));
         r=0;
         c=0;
         for J=1:n
             if I~=J
                 r=r+abs(A(I,J));
                 c=c+abs(A(J,I));
             end
         end
         N=256;
         t=(0:N)*2*pi/N;
         plot(h+r*cos(t),k+r*sin(t),'-b');
         hold on
         plot(h+c*cos(t),k+c*sin(t),'-r');
         plot(h,k,'+');
     end
     e=eig(A);
     for I=1:n
         plot(real(e(I)),imag(e(I)),'o');
     end
     axis equal
     hold off
end