function [S_R, h_2] = StarRegion(h_L, h_R)
    g = 9.81;

    max_iter = 1000;
    iter = 1;
    error_S_R = inf;
    

    S_R = 1; % Initial guess for S_R

    while error_S_R > eps && iter <= max_iter
        fS_R = 2 * sqrt(g * h_L) + (g * h_R) / (4 * S_R) * (1 + sqrt(1 + (8 * S_R^2) / (g * h_R))) - ((2 * g * h_R) * sqrt(1 + (8 * S_R^2) / (g * h_R)) - (2 * g * h_R))^(1/2) - S_R;
        dfS_R = 2 / sqrt((8 * S_R^2) / (g * h_R) + 1) - (8 * S_R) / ((2 * g * h_R * ((8 * S_R^2) / (g * h_R) + 1)^(1/2) - 2 * g * h_R)^(1/2) * ((8 * S_R^2) / (g * h_R) + 1)^(1/2)) - (g * h_R * (((8 * S_R^2) / (g * h_R) + 1)^(1/2) + 1)) / (4 * S_R^2) - 1;

        S_R_new = S_R - (fS_R / dfS_R);
        error_S_R = abs(S_R_new - S_R);
        S_R = S_R_new;
        iter = iter + 1;
    end

    h_2 = 1; % Initial guess for h_2
    iter = 1;
    error_h_2 = inf; % Initialize error_h_2
 

    while error_h_2 > eps && iter <= max_iter
        fh_2 = (h_R / 2) * sqrt(1 + 8 * (((2 * h_2) / (h_2 - h_R) * ((sqrt(h_L) - sqrt(h_2)) / sqrt(h_R)))^2)) - h_2;
        dfh_2 = (h_R * ((64 * h_2 * (h_2^(1/2) - h_L^(1/2))^2) / (h_R * (h_2 - h_R)^2) + (32 * h_2^(3/2) * (h_2^(1/2) - h_L^(1/2))) / (h_R * (h_2 - h_R)^2) - (64 * h_2^2 * (h_2^(1/2) - h_L^(1/2))^2) / (h_R * (h_2 - h_R)^3))) / (4 * ((32 * h_2^2 * (h_2^(1/2) - h_L^(1/2))^2) / (h_R * (h_2 - h_R)^2) + 1)^(1/2)) - 1;

        h_2_new = h_2 - (fh_2 / dfh_2);
        error_h_2 = abs(h_2_new - h_2);
        h_2 = h_2_new;
        iter = iter + 1;
    end

end