function omega = generare_omega(A)
    M = diag(diag(A));
    N = M-A;
    T = M\N;
    e = eig(T);
    rt = max(abs(e)); 
    omega = 2/(1+sqrt(1-rt^2));
end
