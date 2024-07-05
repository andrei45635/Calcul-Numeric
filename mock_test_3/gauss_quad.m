function [q_nodes, q_coeff] = gauss_quad(alpha, beta)
    n = length(alpha); 
    rb = sqrt(beta(2 : n));
    J = diag(alpha) + diag(rb, -1) + diag(rb, 1);
    [v, d] = eig(J);
    q_nodes = diag(d);
    q_coeff = beta(1) * v(1, :).^2;
end
