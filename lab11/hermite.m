function [g_nodes, g_coeff] = hermite(n)
    beta = [sqrt(pi), [1:n-1] / 2];
    alpha = zeros(n, 1);
    [g_nodes, g_coeff] = gauss_quad(alpha, beta);
end