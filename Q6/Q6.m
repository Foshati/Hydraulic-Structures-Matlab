clc
clear
close all


%%Subject of the question : hllsolver for Dam Break..
%% Data entry
h_L = 10;
h_R = 5;
u_L = 0;
u_R = 0;
%N=100;
x = linspace(0, 2000, 100); 
dx = x(2) - x(1); 
t = 50;
dt = 0.1;
Nt = ceil(t / dt);
g = 9.81;

%% Calculations
F_Ip12 = f_hllsolverQ6(h_L, h_R, u_L, u_R);

% ماتریس برای نگهداری مقادیر h و u در هر سلول
h = zeros(length(x), 1);
u = zeros(length(x), 1);

% مقداردهی اولیه
h(:) = 10;
u(:) = 0;

% Definition of boundary conditions
h(1) = h_L; % شرط مرزی سمت چپ
h(end) = h_R; % شرط مرزی سمت راست
u(1) = u_L; % شرط مرزی سمتچپ
u(end) = u_R; % شرط مرزی سمت راست

for n = 1:Nt
    F_Ip12 = f_hllsolverQ6(h_L, h_R, u_L, u_R);
    for i = 2:length(x)-1
        U_i = [h(1); h(1)*u(1)];
        U_iplus1 = U_i - (dt/dx)*(F_Ip12(:,i-1) - F_Ip12(:,i));

        h(i) = U_iplus1(1);
        u(i) = U_iplus1(2) / U_iplus1(1);
    end
end

%% Plotting
figure;
subplot(2, 1, 1);
plot(x, h, 'b-', 'linewidth', 2);
xlabel('x');
ylabel('h');
title('Variation of h with x');

subplot(2, 1, 2);
plot(x, u, 'r-', 'linewidth', 2);
xlabel('x');
ylabel('u');
title('Variation of u with x');