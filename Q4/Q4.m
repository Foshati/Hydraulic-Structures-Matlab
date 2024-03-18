clc
clear
close all
%%Subject of the question :Exact Solution ...
%% Data entry  
h_L = 10;
h_R = 5;
g = 9.81;
c_L = sqrt(g * h_L);
c_R = sqrt(g * h_R);
t = 50;
x = 0:2000;

%% Calculations

[S_R, h_2] = StarRegion(h_L, h_R);

% u_2:
u_2 = S_R - (g * h_R) / (4 * S_R) * (1 + sqrt(1 + (8 * S_R^2) / (g * h_R)));

% u_3
u_3 = (2/3) * sqrt(g * h_L) + (x / t);

% h_3
h_3 = (4 / (9 * g)) * (sqrt(g * h_L) - (x / (2 * t)));

% Calculation of u_values and h_values
u_values = zeros(1, length(x));
h_values = zeros(1, length(x));

for i = 1:length(x)
    if x(i) <= -t * sqrt(g * h_L)
        u = 0;
        h = h_L;
    elseif (-t * sqrt(g * h_L) < x(i)) && (x(i) <= t * (u_2 - sqrt(g * h_2)))
        u = (2/3) * sqrt(g * h_L) + (x(i) / t);
        h = (4 / (9 * g)) * (sqrt(g * h_L) - (x(i) / (2 * t)));
    elseif (t * (u_2 - sqrt(g * h_2)) < x(i)) && (x(i) <= t * S_R)
        u = S_R - (g * h_R) / (4 * S_R) * (1 + sqrt(1 + (8 * S_R^2) / (g * h_R)));
        h = real((h_R / 2) * sqrt(1 + 8 * (((2 * h_2) / (h_2 - h_R) * ((sqrt(h_L) - sqrt(h_2)) / sqrt(h_R)))^2)));
    elseif t * S_R <= x(i)
        u = 0;
        h = h_R;
    end

    u_values(i) = u;
    h_values(i) = h;
end

%% Plotting
figure;
plot(x, h_values);
xlabel('x');
ylabel('h');
title('Variation of h with respect to x (t constant)');
figure;
plot(x, u_values);
xlabel('x');
ylabel('u');
title('Variation of u with respect to x (t constant)');







