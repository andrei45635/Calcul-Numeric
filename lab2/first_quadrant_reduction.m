function [f, sin_sign, cos_sign] = first_quadrant_reduction(x)
    x = mod(x, 2*pi);
    % first quadrant: sin > 0, cos > 0
    if(x >= 0 && x < (pi / 2))
        sin_sign = 1;
        cos_sign = 1;
        f = x;
    % second quadrant: sin > 0, cos < 0
    elseif (x >= (pi / 2) && x < pi)
        sin_sign = 1;
        cos_sign = -1;
        f = pi - x;
    % third quadrant: sin < 0, cos < 0
    elseif(x >= pi && x < 3 * (pi / 2))
        sin_sign = -1;
        cos_sign = -1;
        f = x - pi;
    % fourth quadrant, sin < 0, cos > 0
    else 
        sin_sign = -1;
        cos_sign = 1;
        f = (2 * pi) - x;
    end
end