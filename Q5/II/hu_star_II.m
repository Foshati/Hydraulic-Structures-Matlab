clc
clear
close all

% Subject of the question:
% Description: In the read section hu_star_ii
% Data entry
h_L = 10;
h_R = 0.1;
u_L = 0;
u_R = 0;
g = 9.81;
c_L = sqrt(g * h_L);
c_R = sqrt(g * h_R);
h_0 = (1 / g) * ((1 / 2) * (c_L + c_R) - (1 / 4) * (u_R - u_L))^2;  % initial assumption
h = h_0;

eps = 1e-6;           % tolerance for convergence
 
iterations = 0;       % Number of iterations
results = [];         % Matrix to store results

min_iterations = 5;   % Minimum number of iterations before checking Err

while true
    c = sqrt(g * h);
    [f_L, f_R] = f_Q3_1(g, h, h_L, h_R);
    [df_L, df_R] = f_Q3_2(g, h, h_L, h_R);
     fh = f_L + f_R + u_L - u_R;
    dfh = df_L + df_R + u_L - u_R;

    hm = h - (fh / dfh);
    Err = abs(hm - h) / (0.5 * (hm + h));
    
    iterations = iterations + 1;  % Increment iteration count
    
    % Store results in matrix
    results(iterations, :) = [iterations-1, h, f_L, f_R, fh,df_L,df_R, dfh, hm];
    
    if Err < eps && iterations >= min_iterations    % Break after convergence
        break;
    end
    
    h = hm;
end


fprintf('Results:\n');
fprintf('Iter     h          f_L        f_R        fh         df_L       df_R       dfh        hm\n');
for i = 1:size(results, 1)
    fprintf('%-8d %-10f %-10f %-10f %-10f %-10f %-10f %-10f %-10f\n', results(i, :));
end


fprintf('\nJavab h_star : %f\n', hm);


h_star = hm;     %h=hm=h_star

[f_L, f_R] = f_Q3_1(g, h, h_L, h_R);
u_star=(1/2)*(u_L+u_R)+(1/2)*(f_R - f_L );


fprintf('\nJavab u_star : %f\n', u_star);


save('hu_star_II.mat', 'h_star', 'u_star' ,'h_L','h_R','u_L','u_R');


