% Metoda de cuadratura adaptiva pentru formula dreptunghiului
function ca = adquad_d(f,a,b,e)
   d = @dreptunghi;
   n  = 5;
   ca1 = d(f,a,b,n);
   ca2 = d(f,a,b,n*2);
   
   if abs(ca1-ca2) < e 
       ca = ca2;
       return
   else
       ca = adquad_d(f,a,(a+b)/2,e) + adquad_d(f,(a+b)/2,b,e);
   end
end