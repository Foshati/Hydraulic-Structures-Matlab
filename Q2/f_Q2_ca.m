function [U, F, S] = f_Q2_ca(h, u, g, s)
    U = [h; h * u];
    F = [u * h; u^2 * h + 1/2 * g * h^2];
    S = [0; g * h * s];
end