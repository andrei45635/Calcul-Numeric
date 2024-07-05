function pols=Lagrange_polynomials_for_given_grade(x,xi,grades)
if nargin ~=3 
    error('Illegal number of arguments')
end
[mu,nu]=size(xi);
fi=zeros(mu,nu);
np1=length(x);
current_ind = 1;
pols = zeros(mu,nu);
for i=grades
    z=ones(mu,nu);
    for j=[1:i-1,i+1:np1]       
        z=z.*(xi-x(j))/(x(i)-x(j)); 
    end
    pols(current_ind) = z;
    current_ind = current_ind + 1;
end
