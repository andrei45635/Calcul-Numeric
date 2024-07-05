function [A, b] = generare_sistem_test(n)
    A = zeros(n, n);
    A = A + diag(3 * ones(n, 1));
    A = A + diag(-1 * ones(n - 1, 1), 1) + diag(-1 * ones(n - 1, 1), -1);
    for i = 1:n
         j = n - i + 1;
         if j ~= i + 1 && j ~= i - 1
             A(i, j) = 1/2;
         end
    end

    disp(A);

    b = zeros(1, n);
    b(1) = 2.5;
    b(n) = 2.5;
    b(2:n-1) = 1.5;

    midIndex1 = floor(n/2); 
    midIndex2 = ceil(n/2) + 1; 

    b(midIndex1) = 1.0;
    b(midIndex2) = 1.0;
    
    disp(b);
end