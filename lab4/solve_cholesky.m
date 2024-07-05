function x = solve_cholesky(A, B)
    R = cholesky_decomposition(A);
    y = (R.')\B;
    x = R\y;
end