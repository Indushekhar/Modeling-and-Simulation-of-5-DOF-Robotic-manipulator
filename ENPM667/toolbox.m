%validation program for Forward Kinematics%
l1= Link([ 0 15 0 -pi/2]);
l2= Link([ 0 0 10 0]);
l3 =Link([ 0 0 10 0]);
l4 = Link([ 0 0 0 -pi/2]);
l5 =Link([ 0 22 0 0]);
r= SerialLink([l1 l2 l3 l4 l5],'name' ,'DOF')
ikine_sym