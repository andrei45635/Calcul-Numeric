% Metoda secantei pentru ecuatii liniare pe R
% input : f - functia
%         x0, x1 - pct de pornire
%         err_abs, err_r - eroare absoluta, eroare relativa
%         nmax - nr max de iteratii
% output: z - aproximatia solutiei
%         ni - numar iteratii

function [z, ni] = secanta(f, x0, x1, err_abs, err_r, nmax)
     if nargin < 6
        nmax = 50;
    end

    if nargin < 5
        err_r = 0;
    end

    if nargin < 4
        err_abs = 1e-3;
    end

    xv = x0;
    fv = f(xv);
    xc = x1;
    fc = f(xc);
    
    for k=1:nmax
        xn = xc - fc .* (xc - xv) / (fc - fv);
        if abs(xn - xc) < err_abs + err_r * xn
            z = xn;
            ni = k;
            return;
        end
        xv = xc;
        fv = fc;
        xc = xn;
        fc = feval(f, xn);
    end

    error('S-a depasit numarul de iteratii');
end