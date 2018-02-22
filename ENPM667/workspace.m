syms a1 a2 a3 a4 a5 a6 a7 d1 d2 d3 d4 d5 d6 d7 alpha1 alpha2 alpha3 alpha4 alpha5 alpha6 alpha7 a b c d t2_min t3_min

a1 = 0; alpha1 = -pi/2; d1 = 15;
a2 = 10; alpha2 = 0; d2 = 0;
a3 =10; alpha3 = 0; d3 = 0;
a4 = 0; alpha4 = -pi/2; d4= 0;
a5 = 0; alpha5 = 0; d5 = 22;
%In this part we insert the D-H parameters manually to the code.%
% Inserting joint limits for Arms
t1_min=-3.14;t1_max=3.14;
t2_min = -3.14; t2_max = 3.14;
t3_min =-3.14; t3_max =3.14;
t4_min = -3.14; t4_max =3.14;
t5_min = -3.14; t5_max = 3.14;

% Monte Carlo method
% sampling size
N = 20000;
t1 = t1_min + (t1_max-t1_min)*rand(N,1);
t2 = t2_min + (t2_max-t2_min)*rand(N,1);
t3 = t3_min + (t3_max-t3_min)*rand(N,1);
t4 = t4_min + (t4_max-t4_min)*rand(N,1);
t5 = t5_min + (t5_max-t5_min)*rand(N,1);
for i = 1:N
A1 = TransMat(a1,alpha1,d1,t1(i));
A2 = TransMat(a2,alpha2,d2,t2(i));
A3 = TransMat(a3,alpha3,d3,t3(i));
A4 = TransMat(a4,alpha4,d4,t4(i));
A5 = TransMat(a5,alpha5,d5,t5(i));

T = A1*A2*A3*A4*A5;

X=T(1,4);
Y=T(2,4);
Z=T(3,4);
plot3(X,Y,Z,'.')
hold on;
end
view(3);
title('Isometric view');
xlabel('x (cm)');
ylabel('y (cm)');
zlabel('z (cm) ');
function T = TransMat( a,b,c,d )
T = [ cos(d) -sin(d)*cos(b) sin(d)*sin(b) a*cos(d); sin(d) cos(d)*cos(b) -cos(d)*sin(b) a*sin(d);
0 sin(b) cos(b) c;
0 0 0 1
];
end