function [df_L, df_R] = f_Q3_2(g, h, h_L, h_R)
    if h <= h_L 
        df_L = g / sqrt(g * h);
    elseif h > h_L
        gh_L = sqrt((1/2) * g * ((h + h_L) / (h * h_L)));
        df_L = gh_L - (g * (h - h_L) / (4 * h^2 * gh_L));
    end

    if h <= h_R
        df_R = g / sqrt(g * h);
    elseif h > h_R
        gh_R = sqrt((1/2) * g * ((h + h_R) / (h * h_R)));
        df_R = gh_R - (g * (h - h_R) / (4 * h^2 * gh_R));
    end
end