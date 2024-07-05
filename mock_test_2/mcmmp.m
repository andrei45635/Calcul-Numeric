%{
function res = mcmmp(x, y, functions, points)
    phi = functions(x);
    phi_approx = functions(points);
    
    n = length(x);
    [n, ~] = size(phi);
    
    % A = Z^T * Z ; B = Z^T * y ; unde Z^T e phi
    for i = 1 : n
        for j = 1 : n
            A(i, j) = phi(i, :) * transpose(phi(j, :));
        end
        B(i, 1) = phi(i, :) * transpose(y);
    end
    
    % A * a = B
    a = linsolve(A, B);
    
    res = transpose(a) * phi_approx;
end

function res = mcmmp(x, y, functions, points)
    phi = functions(x);
    phi_approx = functions(points);

    % n = length(x);
    [n, m] = size(phi);
    
    % Initialize A and B
    A = zeros(m, m);
    B = zeros(m, 1);
    
    % Compute A and B
    for i = 1 : m
        for j = 1 : m
            A(i, j) = sum(phi(:, i) .* phi(:, j));
        end
        B(i) = sum(phi(:, i) .* y);
    end
    
    % Solve A * a = B
    a = linsolve(A, B);
    
    % Compute the approximation
    res = phi_approx * a;
end
%}

function res = mcmmp(x, y, functions, points)
    phi = functions(x);          % Evaluate basis functions at x points
    phi_approx = functions(points); % Evaluate basis functions at points for approximation
    
    phi = phi';  % Each row is now a point, and each column is a basis function
    phi_approx = phi_approx';  % Each row is now a point, and each column is a basis function

    [n, m] = size(phi); % n is the number of points, m is the number of basis functions

    % Compute A and B using matrix operations
    A = phi' * phi;  % m x m matrix
    B = phi' * y;   % m x 1 vector
    
    % Solve A * a = B for the coefficients a
    a = linsolve(A, B);

    % Compute the approximation at the specified points
    res = phi_approx * a;
end
