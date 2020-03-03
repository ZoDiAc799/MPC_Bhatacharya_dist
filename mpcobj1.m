
clear all;
rt = 0.5;  %rise time in seconds
Ts = 0.1;
A = [0 1 -1 0;0 0 0 0;0 0 0 1;0 0 0 -1/rt];
B = [0 0; 0 1; 0 0;1/rt 0];
C = [1 0 0 0;0 0 1 0];    %0 0 1;
D = [0 0;0 0];

% A = [-2 0;1 0];%[0 1 0;0 0 1;0 0 -1/rt];
% B = [1; 0];
% C = [0 2];    %0 0 1;
% D = 0;
sys = ss(A,B,C,D);
sysd = c2d(sys,0.1);
plant = setmpcsignals(sysd,'MV',1,'MD',2);

mpcobj = mpc(plant);
%mpcobj.Model.Plant=minreal(mpcobj.Model.Plant);
obsv(A,C)
% a = [0 0 1];
% b = [0.5 1 0];
% [Aa,Bb,Cc,Dd] = tf2ss(a)