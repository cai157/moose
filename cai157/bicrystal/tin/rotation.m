A = [16.4 0 0;
    0 16.4 0;
    0 0 32];
th1= 5/12*pi;
R1 = [1 0 0;
    0 cos(th1) sin(th1);
    0 -sin(th1) cos(th1)];
RT1 = R1.';
AA = R1*A*RT1;

th2= 1/6*pi;
R2 = [1 0 0;
    0 cos(th2) sin(th2);
    0 -sin(th2) cos(th2)];
RT2 = R2.';
AAA = R2*AA*RT2

th3 = 5/12*pi;
R3 = [cos(th3) sin(th3) 0;
     -sin(th3) cos(th3) 0;
     0 0 1];
RT3 = R3.';
AAAA = R3*AAA*RT3
