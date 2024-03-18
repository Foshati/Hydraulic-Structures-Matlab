
function [Y1,Y2,R1,R2,A1,P1,P2,P3,M,A2] = f_Q2_cb(u,c)
    Y1 =  u - c;
    Y2 =  u + c;
    R1 = [1; Y1];
    R2 = [1; Y2];
    A1=  [0, 1; c^2 - u^2, 2*u];
    P1 = [1, 1; u - c, u + c]; 
    P2 = inv(P1);
    P3 = [(c + u)/(2*c), -1/(2*c); (c - u)/(2*c), 1/(2*c)];  %P2=P3   for test
    M = [u - c, 0; 0, u + c]; %M=matrix ghotri shode
    A2 = P1 * M * P3;         %A1=A2  for test
end   