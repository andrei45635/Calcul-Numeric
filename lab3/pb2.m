% conditionare matricei Vandermonde
% pentru t_k = -1 + k * (2 / n), puncte echidistante in [-1, 1] si n = 10,15 in raport cu norma Cebisev
start = 10;
stop = 15;

A = zeros(1, start - stop); 
b = zeros(1, start - stop);

for n = start:stop
    k = linspace(-1, 1, n);
    t = -1 + k .* (2 ./ n);
    V = vander(t);
    A(n - start + 1) = cond(V, inf);
end

% pentru t_k = 1 / k, k = 1,n si n = 10,15
for n = start:stop
    k = 1:n;
    o = ones(1, n);
    t = o ./ k;
    V = vander(t);
    b(n - start + 1) = cond(V, inf);
end

fprintf("Vander");
figure(1);
plot(start:stop, log10(A),'r*',start:stop, log10(b),'b*');
