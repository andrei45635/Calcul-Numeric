% eliminare gaussiana cu pivotare scalata pe coloana
function x = gauss_elim(A, B)
    n = size(A, 1);
    x = zeros(size(B));
    line_sums = sum(abs(A), 2);
    A = [A, B];
    pivot = 1:n;

    for i = 1:n-1
        [u, p] = max(abs(A(i:n, i)) ./ line_sums(i:n));
        p = p + i - 1;
        if u == 0
            error("Nu exista solutie unica");
        end
        if p ~= i
            pivot([i, p]) = pivot([p, i]);
        end 
        for j = i+1:n
            m = A(pivot(j), i) / A(pivot(i), j);
            A(pivot(j),i+1:n+1) = A(pivot(j),i+1:n+1)- m * A(pivot(i),i+1:n+1);
        end
    end

    x(n) = A(pivot(n), n + 1) / A(pivot(n), n);
    for i = n-1:-1:1
        x(i) = (A(pivot(i), n + 1) - A(pivot(i), i+1:n) * x(i+1:n)) / A(pivot(i), i);
    end
end

% ne uitam la operatiile +, -, *, /
% de exemplu, in linia de cod: A(pivot(j),i+1:n+1) = A(pivot(j),i+1:n+1)- m * A(pivot(i),i+1:n+1); 
% primul loop merge de la 1 la n, al doilea de la j la n si al treilea tot
% de la j la n
% deci, linia aceasta se executa de aproximativ n^3 ori si precis de n*n +
% (n-1)*(n-1) + ... + 2*2 + 1*1 ceea ce e echivalent cu (1/3)*n^3 flops
% dar, linia aceasta contine si doua operatii in virgula flotanta, - si *,
% astfel avem (2/3) * (n^3) flops
