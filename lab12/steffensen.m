% Metoda Steffensen pentru ecuatii liniare pe R
% input : g    - functia dedusa din f (g(x) = x)
%         p0   - pct de pornire
%         err  - tolerante
%         nmax - nr max de iteratii
% output: p - aproximatia solutiei

function p = steffensen(g, p0, err, nmax)
    i = 1;
    while i <= nmax
        p1 = g(p0);
        p2 = g(p1);
        p2 = p0 - ((p1 - p0) .^ 2 / (p2 - 2 * p1 + p0));
        if abs(p - p0) < err
            return;
        end
        i  = i + 1;
        p0 = p;
    end
    error('S-a depasit numarul de iteratii');
end