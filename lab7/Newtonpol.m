function z=Newtonpol(td,x,t)
%NEWTONPOL - computes Newton interpolation polynomial
%call z=Newtonpol(td,x,t)
%td - divided difference table
%x - interpolation nodes
%t - evaluation points
%z - values of interpolation polynomial

lt=length(t); lx=length(x);     % x e vectorul cu nodurile dublate!!!
for j=1:lt
   d=t(j)-x;     % d = [t-x0,t-x1,t-x2,...]           
   z(j)=[1,cumprod(d(1:lx-1))]*td(1,:)';    
   % cumprod(d(1:lx-1)) ne da: [(t-x0),(t-x0)^2,(t-x0)^2*(t-x1),(t-x0)^2*(t-x1)^2,(t-x0)^2*(t-x1)^2*(t-x2)...]
   % apoi produsul matricilor si anume inmultirea cu td(1,:)' => ne da
   % polinomul Hermite;  td(1,:)' inseamna prima linie din tabela de
   % diferente divizate
end