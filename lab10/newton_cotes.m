function weights = newton_cotes(n)
    syms x;
    a = 0;
    b = 1;
    nodes = linspace(a, b, n); 
    weights = zeros(1, n);
    
    for i = 1:n
        L_i = 1;
        for j = 1:n
            if j ~= i
                L_i = L_i * (x - nodes(j)) / (nodes(i) - nodes(j));
            end
        end
        weights(i) = double(int(L_i, x, a, b));
    end
end
