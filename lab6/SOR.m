function x = SOR(A, b, omega, tolerance)
    if (omega<=0) || (omega>=2)
        error('parametrul relaxarii ilegal')
    end
    [m,n]=size(A);
    x0=zeros(size(b));
    if (m~=n) || (n~=length(b))
        error('dimensiuni ilegale')
    end
   
    M = 1/omega*diag(diag(A))+tril(A,-1);
    N = M-A;
    T = M\N;
    c = M\b;
    alfa = norm(T,inf);
    x = x0(:);
    true = 1;
    while true==1
        x0 = x;
        x = T*x0+c;
        if norm(x-x0,inf)<(1-alfa)/alfa*tolerance
            true = 0;
        end
    end
end