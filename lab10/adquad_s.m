% Metoda de cuadratura adaptiva pentru formula lui Simpson
function ca = adquad_s(f,a,b,e)
   s = @simpson;
   n  = 5;
   
   ca1 = s(f,a,b,n);
   ca2 = s(f,a,b,n*2);
   
   if abs(ca1-ca2) < e 
       ca = ca2;
       return
   else
       ca = adquad_s(f,a,(a+b)/2,e) + adquad_s(f,(a+b)/2,b,e);
   end
end
