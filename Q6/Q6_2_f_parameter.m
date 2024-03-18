clc
clear
close all


u_iminus1 = 0.7;    
h_iminus1 = 1.4;

u_i = 0.8;
h_i = 1.2;

u_iplus1 = 0.9;
h_iplus1 = 1.1;


%[F_I-1/2] = f_hllsolver(h_i-1   ,h_i ,  u_i-1    , u_i)
[F ,h_star,u_star, c_L, c_R, c_star, S_L, S_R, F_L, F_R, F_M, U_R, U_L] = f_hllsolverQ6_2(h_iminus1 ,h_i , u_iminus1 , u_i );