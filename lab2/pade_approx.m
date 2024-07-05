function R = pade_approx(val, f, m, n)
    if n > m
        aux = m;
        m = n;
        n = aux;
    end

    % computing c(i)
    syms x;
    fact = 1;

    [val, ~, ~] = first_quadrant_reduction(val);

    coeffs = zeros(1, m * n + 1);
    coeffs(1) = eval(subs(f, x, 0)); % first term is always f(0)

    for i = 1:m+n
        fact = fact * i;
        func = diff(f, i) / fact; % c(i) = f derivat de i ori / i!
        coeffs(i + 1) = eval(subs(func, x, 0));
    end

    % Toeplitz
    T = toeplitz(coeffs(m + 1 : m + n), coeffs(m + 1:-1:m - n + 2));
    % taking the terms from m+n to m+1
    y = coeffs(m + n + 1:-1:m + 2);
    % transforming to column matrix
    y = rot90(y);
    % multiply the matrix with -1 
    y = -1.*y;
    % find b's coefficients (solving the C*b = y system) 
    b = T \ y; 
     % add 1 to first column 
    b = [1; b];
    
    % find a's coefficients
    a = zeros(m+1, 1);
    for j=1:m+1
    	for l=1:min(j, n+1) % for l + k > 1 => b = 0
    		a(j) = a(j) + coeffs(j-l+1)*b(l);
    	end
    end
    
    P = polyval(a(m+1:-1:1), val);
    Q = polyval(b(n+1:-1:1), val);
    R = P./Q;
end