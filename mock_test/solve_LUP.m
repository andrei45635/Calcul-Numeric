function x = solve_LUP(A, B)
    [L, U, P] = LUP_decomposition(A);
    det(L)
    L
    U
    P
    y = L \ (P .* B);
    x = U \ y;
end