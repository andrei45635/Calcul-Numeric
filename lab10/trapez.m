function t = trapez(f, a, b, n)
    dx = (b - a) / n;
    t = f(a) + f(b);

    for i=1:n-1
        xi = a + i * dx;
        t = t + (2 * f(xi));
    end

    t = (dx / 2) * t;
end