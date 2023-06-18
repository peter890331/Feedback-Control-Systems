clear;
clc;

%Q1:
K1=10;
K2=200;
K3=500;
num1=[5*K1];
den1=[1 15 K1];
num2=[5*K2];
den2=[1 15 K2];
num3=[5*K3];
den3=[1 15 K3];
sys1=tf(num1,den1);
sys2=tf(num2,den2);
sys3=tf(num3,den3);
t=[0:0.01:2];
figure(1)
[y1,t]=step(sys1,t);
[y2,t]=step(sys2,t);
[y3,t]=step(sys3,t);
plot(t,y1,t,y2,'r',t,y3,'b')
legend('K=10','K=200','K=500')
title('Q1: Responses of K=10,200,500')
sys1_Overshoot = stepinfo(sys1).Overshoot;
sys1_SettlingTime = stepinfo(sys1).SettlingTime;
sys2_Overshoot = stepinfo(sys2).Overshoot;
sys2_SettlingTime = stepinfo(sys2).SettlingTime;
sys3_Overshoot = stepinfo(sys3).Overshoot;
sys3_SettlingTime = stepinfo(sys3).SettlingTime;
K_value=["K=10";"K=200";"K=500"];
Percent_Overshoot = [sys1_Overshoot;sys2_Overshoot;sys3_Overshoot];
Settling_Time = [sys1_SettlingTime;sys2_SettlingTime;sys3_SettlingTime];
Steady_State_Error = [4;4;4];
Q1_result_table = table(K_value,Percent_Overshoot,Settling_Time,Steady_State_Error)

%Q2:
num2a = [10]; den2a = [1 2 0];
sys2a = tf(num2a,den2a);
fprintf('Q2(a):\n')
sys2af = feedback(sys2a,1)
num2b=[1]; den2b=[1 2 0];
sys2b=tf(num2b,den2b);
fprintf('Q2(b):\n')
sys2bf = feedback(sys2b,10)
t=[0:0.01:10];
figure(2);
subplot(211);
[y2a,t]=step(sys2af,t);
plot(t,y2a)
title('Q2(a): Step response')
subplot(212);
[y2b,t]=step(sys2bf,t);
plot(t,y2b)
title('Q2(b): Disturbance response')
fprintf('Q2(c):\n')
fprintf('The ess of unit step input is: 0\n')
fprintf('The ess of unit disturbance is: 0.1\n')
fprintf('Q2(d):\n')
fprintf('The maximum tracking error of unit step input is: '+string(max(y2a)-1)+' at '+string(t(find(y2a==max(y2a))))+'s\n')
fprintf('The maximum tracking error of unit disturbance is: '+string(max(y2b))+' at '+string(t(find(y2b==max(y2b))))+'s\n')

%Q3:
num3=35; den3=[1 12 35];
t=[0:0.01:2];
ya=(35/2)*(exp(-5*t)-exp(-7*t));
sys3 = tf(num3,den3);
y3=impulse(sys3,t);
figure(3)
plot(t,y3,t,ya,'--')
legend('Compute','Analytically')
title('Q3: Compare the result of Compute and Analytically')

%Q4:
num4 = [10]; den4 = [1 20 75 0];
sys4 = tf(num4,den4);
sys4f = feedback(sys4,1);
t=[0:0.01:100];
figure(4)
s = tf('s');
[y4,t]=step(sys4f/s,t);
plot(t,y4)
title('Q4: Ramp response')
fprintf('Q4: \n')
fprintf('The ess of ramp step input is: 7.5\n')