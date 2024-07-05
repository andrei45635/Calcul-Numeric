function [z,td]=divdiffdn(x,f,fd)
%DIVDIFFDN - compute divide difference table for double nodes
%call [z,td]=divdiffdn(x,f,fd)
%x -nodes
%f - function values at nodes
%fd - derivative values in nodes
%z - doubled nodes
%td - divided difference table

z=zeros(1,2*length(x)); % de doua ori cate noduri avem
lz=length(z);           % numarul de noduri
z(1:2:lz-1)=x;          % impreuna cu linia de mai jos, obtinem z care contine nodurile dublate
z(2:2:lz)=x;            % gen z(1),z(2) = f(x(1)); z(3),z(4) = f(x(2)); z(5),z(6) = f(x(3)) ...

td=zeros(lz,lz);        % matrice de 2*length(x) X 2*(length(x))
td(1:2:lz-1,1)=f';      % se traduce: inainte de prima virgula din paranteza exprimam indexarea liniilor, dupa virgula exprimam indexarea coloanelor
                        % de la linia 1, din 2 in 2, pana la linia lz-1
                        % pe coloana 1 se pun valorile functiei in f
td(2:2:lz,1)=f';        % se pun dubluri/ dubleaza valorile ca si la z
td(1:2:lz-1,2)=fd';     % de la linia 1, din 2 in 2, pana la linia lz-1 pe coloana 2 se pun valorile derivatei intai
td(2:2:lz-2,2)=(diff(f)./diff(x))';         % diff(f) = [f(2)-f(1), f(3)-f(2), f(4)-f(3) ... ] --> un vector de lungime length(f) - 1 
                                            % care reprezinta diferentele elementelor adiacente
                                            % deci, de la linia 2, din 2 in 2, pana la linia lz-2, se pun valorile:
                                            % (f(x1)-f(x0))/(x1-x0), (f(x2)-f(x1))/(x2-x1) ...
for j=3:lz
   td(1:lz-j+1,j)=diff(td(1:lz-j+2,j-1))./(z(j:lz)-z(1:lz-j+1))';
end
