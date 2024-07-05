function z0=CubH(a,b,fa,fb,fpa,fpb,t0,flag,noNodes)

x = [a,b];
y=[fa,fb];
yd=[fpa,fpb];
%calculăm tabele de diferențe divizate cu noduri duble
[z,T]=divdiffdn(x,y,yd);
%aproximantele
z0=Newtonpol(T,z,t0);
if flag == 1
    t=linspace(0,pi,noNodes);
    zt=Newtonpol(T,z,t);
    plot(x,y,'o',t,sin(t),t,zt)
    legend('noduri','f','H_{n}f','Location','best');
    xlabel('$x$','Interpreter','Latex')
    xlabel('$y$','Interpreter','Latex')
    title('Interpolare Hermite')
    %plot(t,sin(t))
    title('Functia sin')
end
end