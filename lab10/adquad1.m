function q = adquad1(f,a,b,e)
  c = (a+b)/2;
  fa = f(a); 
  fb = f(b); 
  fc = f(c);
  q = quadstep(f,a,b,e,fa,fc,fb);
end