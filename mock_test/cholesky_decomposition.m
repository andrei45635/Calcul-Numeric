function R = cholesky_decomposition(A)
    m = size(A, 1);
    for k = 1:m
        for j = k+1:m
            A(j, j:m) = A(j, j:m) - A(k, j:m) * A(k, j)/A(k, k);
        end
        A(k, k:m) = A(k, k:m)/sqrt(A(k, k));
    end
    R = triu(A);
end