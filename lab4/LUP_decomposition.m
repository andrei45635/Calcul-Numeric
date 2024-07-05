function [L, U, P] = LUP_decomposition(A)
    [m, n] = size(A);
    P = zeros(m, n);
    p = (1:m)';

    for i = 1:m-1
        [~, pivot_poz] = max(abs(A(i:m, i)));
        pivot_poz = pivot_poz + i - 1;
        if i ~= pivot_poz
            A([i,pivot_poz],:) = A([pivot_poz,i],:);
            p([i,pivot_poz])   = p([pivot_poz,i]);
        end
        lin = i+1:m;
        A(lin, i)   = A(lin, i) / A(i, i);
        A(lin, lin) = A(lin, lin) - A(lin, i) * A(i, lin);
    end

    for i = 1:m
        P(i, p(i)) = 1;
    end

    U = triu(A); % decupeaza triunghiul de sus al lui A
    L = tril(A, -1); % decupeaza triunghiul de jos al lui A fara diagonala principala
    L = L + eye(m); % 1 pe diagonala principala
end