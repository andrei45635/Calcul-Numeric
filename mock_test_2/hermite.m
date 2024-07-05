function [result] = hermite(x, f, fderiv, point)
    n = length(x);

    z = zeros(2*n, 1);
    Q = zeros(2*n, 2*n);
    
    for i = 1:n
        z(2*i-1) = x(i);
        z(2*i) = x(i);
        Q(2*i-1, 1) = f(i);
        Q(2*i, 1) = f(i);
        Q(2*i, 2) = fderiv(i);
        if i > 1
            Q(2*i-1, 2) = (Q(2*i-1, 1) - Q(2*i-2, 1)) / (z(2*i-1) - z(2*i-2));
        end
    end
    
    for j = 3:2*n
        for i = j:2*n
            Q(i, j) = (Q(i, j-1) - Q(i-1, j-1)) / (z(i) - z(i-j+1));
        end
    end
    
    result = Q(1, 1);
    product_term = 1;
    for i = 2:2*n
        product_term = product_term * (point - z(i-1));
        result = result + Q(i, i) * product_term;
    end
end
