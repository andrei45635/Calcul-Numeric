function [g_nodes, g_coeff] = cebisev1(n)
    g_coeff = pi / n * ones(1, n);
    g_nodes = cos(pi * ([1:n]' - 0.5) / n);
end