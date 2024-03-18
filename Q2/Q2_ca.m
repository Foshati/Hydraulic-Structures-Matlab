clc
clear
close all

%%Subject of the question : Calculations U, F, S
%%Description             : In the read section Q2_ca
%%Data entry
n = 0.03;
s = 0.001;
t = 20;
h = 0.8;
u = 1.2;
g = 9.81;

%% Calculations
[U, F, S] = f_Q2_ca(h, u, g, s);





    
 %% print
  fprintf('U =\n    %.4f\n    %.4f\n', U);
  fprintf('F =\n    %.4f\n    %.4f\n', F);
  fprintf('S =\n    %.4f\n    %.4f\n', S);














