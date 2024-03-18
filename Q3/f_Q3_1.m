function [f_L, f_R] = f_Q3_1(g, h, h_L, h_R)
    if h <= h_L 
       f_L = 2*(sqrt(g*h) - sqrt(g*h_L));
    elseif h > h_L
       f_L = (h - h_L) * sqrt((1/2)*g*((h + h_L)/(h * h_L)));
    end

    if h <= h_R
       f_R = 2*(sqrt(g*h) - sqrt(g*h_R));
    elseif h > h_R
       f_R = (h - h_R) * sqrt((1/2)*g*((h + h_R)/(h * h_R)));
    end
end