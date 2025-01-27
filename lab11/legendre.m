function [g_nodes, g_coeff] = legendre(n)
    beta = [2, (4 - ([1 : n - 1]).^(-2)).^(-1)];
    alpha = zeros(n, 1);
    [g_nodes, g_coeff] = gauss_quad(alpha, beta);
end