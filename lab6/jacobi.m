function x = jacobi(A, b, tolerance)
    [m, n] = size(A);
    x0     = zeros(size(b));
    
    if(m ~= n) || (n ~= length(b))
        error('Dimensiuni invalide')
    end

    M = diag(diag(A));
    N = M - A;
    T = inv(M) * N;
    c = inv(M) * b;
    alfa = norm(T, inf);
    x = x0(:);

    ok = 1;
    while ok == 1
        x0 = x;
        x = T * x0 + c;
        if norm(x - x0, inf) < (1 - alfa) / alfa * tolerance
            ok = 0;
        end
    end
end