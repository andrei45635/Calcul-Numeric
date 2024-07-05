function F = equation(x)
    A1 = x(1);
    A2 = x(2);
    t1 = x(3);
    t2 = x(4);

    F(1) = A1 + A2 - 1;
    F(2) = A1 * t1 + A2 * t2;
    F(3) = A1 * (t1^2) + A2 * (t2^2) - (pi^2/3);
    F(4) = A1 * (t1^3) + A2 * (t2^3);
end