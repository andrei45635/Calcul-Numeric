function c=cubicspline(x,f,type,der)
%CUBICSPLINE - find coefficients of a cubic spline
%call c=Splinecubic(x,f,type,der)
%x - abscissas 
%f - ordinates 
%type - 0  complete (clamped)
%       1  match second derivatives
%       2  natural
%       3  not a knot (deBoor)
%der - values of derivatives
%      [f'(a),f'(b)] for type 0
%      [f''(a), f''(b)] for type 1
%c - coefficients (length(x)-1) by 4 matrix, in decreasing order/line
%Method - see Gautschi - Numerical Analysis. An Introduction. 2nd edition
% Birkhauser

if (nargin < 4) || (type == 2), der=[0, 0]; end %natural spline

n = length(x);
 
%order nodes if needed
if any(diff(x) < 0)           % daca elementul adiacent din dreapta e mai mic de cel din stanga 
    [x,ind] = sort(x);        % x -> devine sortat; ind -> se stocheaza indicii
    y = f(ind);
% else ind=1:n;
else y = f(:);
end 

% y=f(ind);  
x=x(:);    
y=y(:);     

%auxiliary unknowns - values of the spline derivative
dx=diff(x);         % compute delta_x => dimensiunea sectiunii (xi+1 -xi)
ddiv=diff(y) ./ dx;   % divided differences 
                    % (f(2)-f(1))/(x2-x1),(f(3)-f(2))/(x3-x2), ...

%prepare diagonals
ds = dx(1:end-1);     % delta_xi-1       
dd = dx(2:end);       % delta_xi         
dp = 2 * (ds + dd);                 
md = 3 * (dd .* ddiv(1:end-1) + ds .* ddiv(2:end));   

switch type
case 0 %complete 
    dp1 = 1; dpn = 1;                       % primul si ultimul element de pe diagonala principala din matricea A
    vd1 = 0;                                % primul element de pe supra-diagonala 1 din matricea A
    vdn = 0;                                % ultimul element de pe sub-diagonala 1 din matricea A
    md1 = der(1); mdn = der(2);             % cand avem valorile derivatelor intai in capetele intervalului; se pun pe prima si ultima pozitie in matricea coloana b
case {1,2}
    dp1 = 2; dpn = 2;      
    vd1 = 1;                % 1 pt ca avem m2 simplu
    vdn = 1;                % 1 pt ca avem m_n-1 simplu
    md1 = 3 * ddiv(1) - 0.5 * dx(1) * der(1);     
    mdn = 3 * ddiv(end) + 0.5 * dx(end) * der(2);
    % in cazul splinei naturale der(1) = der(2) = 0
case 3 %deBoor
    x31 = x(3) - x(1);        
    xn = x(n) - x(n-2);
    dp1 = dx(2); 
    dpn = dx(end-1);
    vd1 = x31;
    vdn = xn;
    md1 = ((dx(1) + 2 * x31) * dx(2) * ddiv(1) + dx(1)^2 * ddiv(2)) / x31;
    mdn = (dx(end)^2 * ddiv(end - 1) + (2 * xn + dx(end)) * dx(end-1) * ddiv(end)) / xn;
end

%sparse system
dp = [dp1;dp;dpn];
dp1 = [0;vd1;dd];               % 0 -> semnifica ca acel element nu se foloseste; doar s-a pus ca sa matchuiasca lungimile celorlalte diagonale ca sa mearga functia spdiags
dm1 = [ds;vdn;0];               % 0 -> semnifica ca acel element nu se foloseste; doar s-a pus ca sa matchuiasca lungimile celorlalte diagonale ca sa mearga functia spdiags
md = [md1;md;mdn];              % vectorul coloana de coeficienti bi  in care pe prima si ultima pozitie 
                                % avem valori corespunzatoare fiacarui caz de spline
A = spdiags([dm1,dp,dp1],-1:1,n,n);   % dm1 -> sub-diagonala 1; dp -> diagonala principala; dp1 -> supra-diagonala 1

m = A \ md;     % rezolvarea sistemului de (n-2) x n ecuatii -> vezi notite caiet; avem matrice tridiagonala

% coeficientii in ordine descrescatoare
c(:,4) = y(1:end-1);      % ci,0
c(:,3) = m(1:end-1);      % ci,1
c(:,2) = (ddiv - m(1:end-1)) ./ dx-dx .* c(:,1);        % ci,2
c(:,1) = (m(2:end) + m(1:end-1) - 2 * ddiv) ./ (dx.^2);   % ci,3
