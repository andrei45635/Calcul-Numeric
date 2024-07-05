function series = sinus(angle)
    [x, sin_sign, ~] = first_quadrant_reduction(angle);
    series = 0;
    taylor = x;
    n = 1;
    while taylor + series ~= series
        series = taylor + series;
        taylor = -taylor * ((x ^ 2) / ((n + 1) * (n + 2)));
        n = n + 2;
    end
    series = sin_sign * series;
end 