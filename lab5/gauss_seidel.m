function z = gauss_seidel(A,B,err)
    [m,n]=size(A);
    if (m~=n) || (n~=length(B))
       error('dimensiuni ilegale')
    end
    x = zeros(n,1);
    M = tril(A);
    N = M-A;
    T = M\N;
    c = M\B;
    alfa = norm(T,inf);
    true = 1;
    i = 1;
    while true ==1
       x(:,i+1) = T*x(:,i)+c;
       if norm(x(:,i+1)-x(:,i),inf)<(1-alfa)/alfa*err
          z=x(:,i+1);
          true = 0;
       end
       i = i+1;
    end
end
