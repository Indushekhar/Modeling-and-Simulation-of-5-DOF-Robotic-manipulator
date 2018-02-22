%Forward Kinematics - Converts angles into co-ordinates
a=[0 10 10 0 0]';
d=[15 0 0 0 22]';
A=[-90,0,0,-90,0];
A=deg2rad(A);
prompt = 'Input Joint 1 Desired Angle in Degree ';
q1 = input(prompt);
q1=deg2rad(q1);
prompt = 'Input Joint 2 Desired Angle in Degree ';
q2 = input(prompt);
q2=deg2rad(q2);
prompt = 'Input Joint 3 Desired Angle in Degree ';
q3 = input(prompt);
q3=deg2rad(q3);
prompt = 'Input Joint 4 Desired Angle in Degree ';
q4 = input(prompt);
q4=deg2rad(q4);
prompt = 'Input Joint 5 Desired Angle in Degree ';
q5 = input(prompt);
q5=deg2rad(q5);
q=[q1,q2,q3,q4,q5];
n=5;
T1_n = eye(4);
T{n} = zeros(4);
for i=1:n
T_i=[cos(q(i)), -cos(A(i))*sin(q(i)), sin(A(i))*sin(q(i)),  a(i)*cos(q(i));
    sin(q(i)),  cos(A(i))*cos(q(i)),-sin(A(i))*cos(q(i)),  a(i)*sin(q(i));
            0,            sin(A(i)),           cos(A(i)),            d(i);

           0,                    0,                   0,              1];
       
       
T1_n = T1_n * T_i;

end
Tot=T1_n;
Position_EndEffector= T1_n((1:3),4)'
Orientation_EndEffector = [T1_n((1:3),1)  T1_n((1:3),2)  T1_n((1:3),3)]
