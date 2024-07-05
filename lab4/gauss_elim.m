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
            A(pivot(j),i+1:n+1) = A(pivot(j),i+1:n+1)-m * A(pivot(i),i+1:n+1);
        end
    end

    x(n) = A(pivot(n), n + 1) / A(pivot(n), n);
    for i = n-1:-1:1
        x(i) = (A(pivot(i), n + 1) - A(pivot(i), i+1:n) * x(i+1:n)) / A(pivot(i), i);
    end
end