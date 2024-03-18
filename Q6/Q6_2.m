clc
clear
close all
%%Subject of the question : hllsolver for interface &...
%%Data entry
u_iminus1 = 0.7;    
h_iminus1 = 1.4;

u_i = 0.8;
h_i = 1.2;

u_iplus1 = 0.9;
h_iplus1 = 1.1;


x=100;      %Delta_x
t=50;        %Delta_t

%%Calculations
%for interface i+1/2  => U_L = U_i     U_R = U_i+1
% for interface i-1/2  => U_L = U_i-1   U_R = U_i
%F_L=F(U_L);
%F_R=F(U_R);
 

%[F_I+1/2] = f_hllsolver(h_i ,h_i+1, u_i, u_i+1)
 [F_Ip12] = f_hllsolverQ6_2 (h_i ,h_iplus1 , u_i, u_iplus1 );


%[F_I-1/2] = f_hllsolver(h_i-1   ,h_i ,  u_i-1    , u_i)
[F_Im12] =   f_hllsolverQ6_2(h_iminus1 ,h_i , u_iminus1 , u_i );


U_i=[h_i ;h_i*u_i];

U_iplus1 = U_i - (t/x)*( F_Ip12 - F_Im12 );
[h_N, u_N] = deal(U_iplus1(1), U_iplus1(2) / U_iplus1(1));


%%print
disp('F_I+1/2');
disp(F_Ip12);
disp('F_I-1/2');
disp(F_Im12);
disp('U_i+1');
disp(U_iplus1);
disp('h_N');
disp(h_N);
disp('u_N');
disp(u_N);










 
