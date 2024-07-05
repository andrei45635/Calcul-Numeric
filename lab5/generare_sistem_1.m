function [A, b] = generare_sistem_1(n)
    A = spdiags([-ones(n, 1), 5 * ones(n, 1), -ones(n, 1)], -1:1, n, n);
    full(A);
    b = A * ones(n, 1);
end