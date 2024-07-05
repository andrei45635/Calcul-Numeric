% Metoda lui Newton pentru ecuatii liniare pe R
% input : f - functia
%         fd - derivata
%         x0 - val de pornire
%         err_abs, err_r - eroare absoluta, eroare relativa
%         nmax - nr max de iteratii
% output: z - aproximatia solutiei
%         ni - numar iteratii

function [z, ni] = newton(f, fd, x0, err_abs, err_r, nmax)
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

    for k=1:nmax
        xc = xv - f(xv) / fd(xv);
        if (abs(xc - xv) < err_abs + err_r * xc) % (abs(xc - xv) < ea + er * xc)
            z = xc;
            ni = k;
            return;
        end
        xv = xc;
    end

    error('S-a depasit numarul de iteratii');
end

