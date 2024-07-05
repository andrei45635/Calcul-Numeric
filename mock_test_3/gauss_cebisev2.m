% Gauss-Cebîșev de speța a II-a
function [g_nodes, g_coeff] = gauss_cebisev2(n)
    beta = [pi / 2, 1 / 4 * ones(1, n - 1)];
    alpha = zeros(n, 1);
    [g_nodes, g_coeff] = gauss_quad(alpha, beta);
end