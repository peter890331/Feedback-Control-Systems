clc;
clear;

%%Q1(a) :
fprintf('------------------Q1(a)------------------')
num_a = [1]; den_a = [1 10];
sys_tf_a = tf(num_a, den_a);
sys_ss_a = ss(sys_tf_a)
%%Q1(b) :
fprintf('------------------Q1(b)------------------')
num_b = [1 5 3]; den_b = [1 8 5];
sys_tf_b = tf(num_b, den_b);
sys_ss_b = ss(sys_tf_b)
%%Q1(c) :
fprintf('------------------Q1(c)------------------')
num_c = [1 1]; den_c = [1 3 3 1];
sys_tf_c = tf(num_c, den_c);
sys_ss_c = ss(sys_tf_c)

%%Q2(a) :
fprintf('------------------Q2(a)------------------')
A_a = [0 1; 2 8]; B_a = [0; 1]; C_a = [1 0]; D_a = [0];
sys_ss_a = ss(A_a, B_a, C_a, D_a);
sys_tf_a = tf(sys_ss_a)
%%Q2(b) :
fprintf('------------------Q2(b)------------------')
A_b = [1 1 0; -2 0 4; 5 4 -7]; B_b = [-1; 0; 1]; C_b = [0 1 0]; D_b = [0];
sys_ss_b = ss(A_b, B_b, C_b, D_b);
sys_tf_b = tf(sys_ss_b)
%%Q2(c) :
fprintf('------------------Q2(c)------------------')
A_c = [0 1; -1 -2]; B_c = [0; 1]; C_c = [-2 1]; D_c = [0];
sys_ss_c = ss(A_c, B_c, C_c, D_c);
sys_tf_c = tf(sys_ss_c)

%%Q3(a) :
fprintf('------------------Q3(a)------------------')
A_3 = [0 1 0; 0 0 1; -3 -2 -5]; B_3 = [0; 0; 1]; C_3 = [1 0 0]; D_3 = [0];
sys_ss_3 = ss(A_3, B_3, C_3, D_3);
sys_tf_3 = tf(sys_ss_3)
%%Q3(b) :
x0_3 = [0 -1 1];
t = [0: 0.1: 10];
u = 0 * t;
[y, T_3, x_3] = lsim(sys_ss_3, u, t, x0_3);
figure(1)
plot(T_3, x_3)
xlabel('Time(s)'),ylabel('x');
legend('x_1','x_2','x_3')
title('Q3(b)')
fprintf('------------------Q3(c)------------------')
xf_sim = x_3(length(t),:)'
%%Q3(c) :
dt = 10;
Phi = expm(A_3 * dt);
xf_phi = Phi*x0_3'

%%Q4 :
A_4 = [0 1; -2 -3]; B_4 = [0; 1]; C_4 = [1 0]; D_4 = [0];
sys_ss_4 = ss(A_4, B_4, C_4, D_4);
sys_tf_4 = tf(sys_ss_4);
x0_4 = [1 0];
t = [0: 0.1: 10];
u = 0 * t;
[y, T_4, x_4] = lsim(sys_ss_4, u, t, x0_4);
figure(2)
plot(T_4, x_4)
xlabel('Time(s)'),ylabel('State Respone');
legend('x_1','x_2')
title('Q4')

%%Q5 :
syms K;
syms s;
A_5 = [0 1 0; 0 0 1; -2 -K -2]; B_5 = [0; 0; 1]; C_5 = [1 0 0]; D_5 = [0];
SI_A = s * eye(3, 3) - A_5;
det_SI_A = det(SI_A);
k = 0: 1: 100;
for i = 1 : length(k)
    figure(3)
    plot(roots([1 2 k(i) 2]), 'o')
    hold on
end
plot([0,0],[-10,10], Color = 'black')
plot([-2.5,2.5],[0,0], Color = 'black')
hold off
title({['Q5']; ['when K>1 will make all the characteristic values lie in the left half-plane.']})
fprintf('------------------Q5------------------\n when K>1 will make all the characteristic values lie in the left half-plane.')