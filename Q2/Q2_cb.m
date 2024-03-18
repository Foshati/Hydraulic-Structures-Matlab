QQclc
clear
close all

%%Subject of the question : Calculations Y1,Y2,R1,R2,A1,P1,P2,P3,M,A2 ..
%%Description             : In the read section Q2_cb
%%Data entry
n = 0.03;
s = 0.001;
t = 20;
h = 0.8;
u = 1.2;
g = 9.81;
c=sqrt(g*h);

%% Calculations
[Y1,Y2,R1,R2,A1,P1,P2,P3,M,A2] = f_Q2_cb(u,c);
%%print
disp('Y1 = ');
disp(Y1);
disp('Y2 = ');
disp(Y2);
disp('R1 = ');
disp(R1);
disp('R2 = ');
disp(R2);
disp('A1 = ');
disp(A1);
disp('P1 = ');
disp(P1);
disp('P2 = ');
disp(P2);
disp('P3 = ');
disp(P3);
disp('M = ');
disp(M);
disp('A2 = ');
disp(A2);