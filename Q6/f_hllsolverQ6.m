function [F_Ip12] = f_hllsolverQ6(h_L, h_R, u_L, u_R)
    N = 100; % تعداد سلول‌ها

    % تعریف ماتریس‌ها برای نگهداری مقادیر h و u در هر سلول
    h = zeros(1, N);
    u = zeros(1, N);

    % مقداردهی اولیه
    h(:) = 10;
    u(:) = 0;

    % تعریف شرایط مرزی
    h(1) = h_L; % شرط مرزی سمت چپ
    h(N) = h_R; % شرط مرزی سمت راست
    u(1) = u_L; % شرط مرزی سمت چپ
    u(N) = u_R; % شرط مرزی سمت راست

    g = 9.81;
    F_Ip12 = zeros(2, N-1);
    
    for  i = 2:N-1
        c_L = sqrt(g * h(i-1));
        c_R = sqrt(g * h(i+1));  
        h_star = (1/g)*((1/2)*(c_L+c_R)+(1/4)*(u(i-1)-u(i+1)))^2;
        u_star = (1/2)*( u(i-1)+ u(i+1) + c_L - c_R);
        c_star = sqrt(g * h_star);
        S_L = min(u(i-1) - c_L, u_star - c_star);
        S_R = max(u(i+1) + c_R, u_star + c_star);
        U_L=[h(i-1) ;h(i-1)* u_L ];
        U_R=[h(i+1) ;h(i+1)* u_R ];
        F_L=[h(i-1) * u_L ;h(i-1) * u_L^2 + (1/2) * g * h(i-1)^2 ];
        F_R=[h(i+1) * u_R ;h(i+1) * u_R^2 + (1/2) * g * h(i+1)^2 ];

        if     S_L >= 0
            F_Ip12(:,i-1) = F_L;    %F_L

        elseif S_R <= 0
            F_Ip12(:,i-1) = F_R;    %F_R

        elseif (S_L < 0) && (0 < S_R)
            F_Ip12(:,i-1) = (S_R * F_L - S_L * F_R + S_R * S_L * (U_R - U_L)) / (S_R - S_L);  %F_M
        end
    end
end