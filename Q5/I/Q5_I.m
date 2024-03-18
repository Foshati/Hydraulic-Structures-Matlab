clc
clear
close all
%%Subject of the question : Complete solution I & Page 40...
%%Data entry
load('hu_star_I.mat', 'h_star', 'u_star' ,'h_L','h_R','u_L','u_R');

% h_L = 10;
% h_R = 5;
% u_L = 0;
% u_R = 0;
% h_star = 7.269204;
% u_star = 2.919933;

g=9.81;
c_L = sqrt(g * h_L);
c_R = sqrt(g * h_R);
c_star = sqrt(g * h_star);

t = 50;
x = 0:2000;
S = x / t;

h = zeros(size(x));
u = zeros(size(x));
%% Calculations
for i = 1:length(x)
    if S(i) <= u_star
        if h_star > h_L   % left wave is a shock
            q_L = sqrt((1/2) * (((h_star + h_L) * h_star) / (h_L^2)));
            S_L = u_L - c_L*q_L;

            if (S_L <= S(i)) && (S(i) <= u_star)
                h(i) = h_star;
                u(i) = u_star;

            elseif S(i) <= S_L
                h(i) = h_L;
                u(i) = u_L;
            end

        elseif h_star <= h_L  % left wave is a rarefaction
            S_HL = u_L - c_L;
            S_TL = u_star - c_star;

            if S(i) <= S_HL
                h(i) = h_L;
                u(i) = u_L;

            elseif (S_HL <= S(i)) && (S(i) <= S_TL)
                h(i) = (1/3 * (u_L + 2*c_L - x(i)/t))^2 / g;    % w_Lfan
                u(i) = (1/3) * (u_L + 2*c_L + (2*x(i))/t);

            elseif (S_TL <= S(i)) && (S(i) <= u_star)
                h(i) = h_star;
                u(i) = u_star;
            end

        end

    elseif S(i) > u_star
        if h_star > h_R   % Right wave is a shock
            q_R = sqrt((1/2) * ((h_star + h_R) * h_star) / (h_R^2));
            S_R = u_R + c_R*q_R;

            if (u_star <= S(i)) && (S(i) <= S_R)
                h(i) = h_star;
                u(i) = u_star;

            elseif S(i) >= S_R
                h(i) = h_R;
                u(i) = u_R;

            end

        elseif h_star <= h_R   % Right wave is a rarefaction
            S_HR = u_R + c_R;
            S_TR = u_star + c_star;

            if (u_star <= S(i)) && (S(i) <= S_TR)
                h(i) = h_star;
                u(i) = u_star;

            elseif (S_TR <= S(i)) && (S(i) <= S_HR)
                h(i) = ((1/3)*(-u_R + 2*c_R + x(i)/t))^2 / g;   % w_Rfan
                u(i) = (1/3) * (u_R - 2*c_R + (2*x(i))/t);

            elseif S(i) >= S_HR
                h(i) = h_R;
                u(i) = u_R;
            end
        end
    end
end
%% Plotting

figure;
plot(x, u);
xlabel('x');
ylabel('u');
title('Variation of u with x');

figure;
plot(x, h);
xlabel('x');
ylabel('h');
title('Variation of h with x');




