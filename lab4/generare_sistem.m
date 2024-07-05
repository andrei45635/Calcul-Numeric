function [A, b] = generare_sistem(n)
    lower = tril(-1 * ones(n), -1);
    upper = zeros(n);
    upper(:, end) = ones(n, 1);
    upper = triu(upper, 1);

    A = eye(n, n) + lower + upper;
    b = [2:-1:-n+3]';
end