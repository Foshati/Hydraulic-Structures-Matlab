clc
clear 
close all


%%Subject of the question : Calculate the normal depth in the trapezoid?
%%Data entry
n=0.024;
b=5;
s=0.0016;
z=1.5;
Q=40;


%Initial assumption
y=0.001;                   


%%Calculations
while 1
    A = b * y + z * y ^ 2 ;
    P = b + 2 * y * sqrt (1 + z ^ 2) ;
    R = A / P;

    Qtest = (A / n) * R ^ (2 / 3) * sqrt (s) ;

    Error = Q - Qtest;

    if Error < eps && y > 0
        break
    end



    if Q > Qtest 
        y=y+0.000001;
    end


end
%%print
disp('y:')
disp(y)