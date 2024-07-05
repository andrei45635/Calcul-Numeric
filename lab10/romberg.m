function rez = romberg(f, a, b, ni, e)
    R = zeros(ni,ni);
    R(1,1) = ((b-a)/2) * (f(a) + f(b));
    
    for i = 2:ni 
      s = 0;
      for j=1:power(2,i-2)
        h = (b-a) / power(2,i-2);
        s = s + f(a + (j-1/2) * h);
      end
      h = (b-a) / power(2,i-2);
      R(i,1) = (1/2) * (R(i-1,1) + h * s);
       
      for j=2:i
        p = 4^(j-1);  
        R(i,j) = (p*R(i,j-1)-R(i-1,j-1))/(p-1);
      end
      if abs(R(i-1,i-1) - R(i,i)) < e
        rez = R(i,i);
        return;
      end
    end
    rez = "eroare"; 
end