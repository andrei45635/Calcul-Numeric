% Metoda aproximarilor succesive pentru ecuatii liniare pe R
% input : f    - functia
%         fd   - derivata
%         x0   - aproximatia initiala
%         err  - toleranta
%         nmax - nr max de iteratii
% output: z  - aproximatia a radacinii
%         ni - numar iteratii

function [z, ni] = succ_aprox(f, fd, x0, err, nmax)
    i = 1;
    xp = x0;
    lambda = fd(x0);

    while i <= nmax
        xc = xp - lambda \ f(xp);
        if norm(xc - xp, inf) < err
            z = xc;
            ni = i;
            return;
        end
        xp = xc;
        i = i + 1;
    end

    error('S-a depasit numarul de iteratii');
end