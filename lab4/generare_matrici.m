function [A, B] = generare_matrici(n)
    max_n = 50;

    % generare elemente matrice A cat timp matricea A este singulara (det(A) = 0)
    while true
        A = ceil(unifrnd(-max_n, max_n, n));
        if(det(A) ~= 0)
            break;
        end
    end

    % pentru ca solutia sa fie [1,...,1]T trebuie ca suma b(i) sa fie egal cu suma elementelor de pe linia i din matricea A
    B = sum(A, 2);
end
