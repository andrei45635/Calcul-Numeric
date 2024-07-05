function series = cosinus(angle)
    [x, ~, cos_sign] = first_quadrant_reduction(angle);
    series = 0;
    taylor = 1;
    n = 0;
    while taylor + series ~= series
        n = n + 1;
        series = taylor + series;
        taylor = (-1)^n * ((x^(2*n)) / (factorial(2*n)));
    end
    series = cos_sign * series;
end 