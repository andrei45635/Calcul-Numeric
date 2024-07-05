function fi=lagrange(x,y,xi)
%LAGRANGE - compute Lagrange interpolation polynomial
%call fi=Lagrange(x,y,xi)
% x,y - nodes coordinates
% xi - evaluation points

if nargin ~=3 
    error('Illegal number of arguments')
end
[mu,nu]=size(xi);
fi=zeros(mu,nu);
np1=length(y);
for i=1:np1
    z=ones(mu,nu);
    for j=[1:i-1,i+1:np1]       % excluzand cazul j = i
        z=z.*(xi-x(j))/(x(i)-x(j)); % polinoamele Lagrange
    end
    fi=fi+z*y(i); % rezulta din formula: (Lmf)(x) = l0(x)*f(x0) + l1(x)*f(x1) + ...
                  %                      (Lmf)(x) = z0*y0 + z1*y1 + ...
end