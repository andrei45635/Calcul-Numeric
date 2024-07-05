% aproximarea unei integrale cu o formulă de tip Gauss
function I = vquad(g_nodes, g_coeff, f)
    I = g_coeff * f(g_nodes);
end