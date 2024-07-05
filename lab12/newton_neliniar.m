% Metoda lui Newton pentru ecuatii neliniare pe R si R^n
% input : f - functia
%         fd - derivata
%         x0 - aproximatia initiala
%         err_abs, err_r - eroare absoluta, eroare relativa
%         nmax - nr max de iteratii
% output: z - aproximatia radacinii
%         ni - numar iteratii

function [z, ni] = newton_neliniar(f, fd, x0, err_abs, err_r, nmax)
    if nargin < 6
        nmax = 50;
    end

    if nargin < 5
        err_r = 0;
    end

    if nargin < 4
        err_abs = 1e-3;
    end

    xp = x0(:);

    for k=1:nmax
        xc = xp - feval(fd, xp) \ feval(f, xp);
        if (norm(xc - xp, inf) < err_abs + err_r * norm(xc, inf))
            z = xc;
            ni = k;
            return;
        end
        xp = xc;
    end
    
    error('S-a depasit numarul de iteratii');
end