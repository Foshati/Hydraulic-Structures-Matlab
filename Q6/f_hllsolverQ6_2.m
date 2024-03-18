function [F, h_star, u_star, c_L, c_R, c_star, S_L, S_R, F_L, F_R, F_M, U_R, U_L] = f_hllsolverQ6_2(h_L, h_R, u_L, u_R)
    g = 9.81;
    c_L = sqrt(g * h_L);
    c_R = sqrt(g * h_R);
    h_star = (1/g)*((1/2)*(c_L+c_R)+(1/4)*(u_L-u_R))^2;
    u_star = (1/2)*(u_L+u_R) + (c_L-c_R);
    c_star = sqrt(g * h_star);
    S_L = min(u_L - c_L, u_star - c_star);
    S_R = max(u_R + c_R, u_star + c_star);

    F_L = [h_L*u_L ; h_L*u_L^2+(1/2)*g*h_L^2];
    F_R = [h_R*u_R ; h_R*u_R^2+(1/2)*g*h_R^2];
    U_R = [h_R ; h_R*u_R];
    U_L = [h_L ; h_L*u_L];

    F_M = (S_R*F_L - S_L*F_R + S_R*S_L*(U_R-U_L)) / (S_R-S_L);

    if S_L >= 0
        F = F_L;
    elseif (S_L <= 0) && (0 <= S_R)
        F = F_M;
    elseif S_R <= 0
        F = F_R;
    end
end