% Function to calculate Chebyshev nodes of the second kind
function nodes = chebyshev(n)
    % Calculate the nodes
    i = 0:n-1;  % Array of indices
    nodes = cos((2*i + 1) * pi / (2 * n));  % Chebyshev nodes calculation
end

% Example usage: Calculate and display Chebyshev nodes of the second kind for n = 3
% n = 3;
% nodes = chebyshevNodesSecondKind(n);
% disp('Chebyshev nodes of the second kind:');
% disp(nodes);
