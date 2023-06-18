clc;
clear;

%%Q1 :
% damping ratio = 0.3
y0 = 0.15;
zeta = 0.3;
wn = 1/(2*zeta);
t = [0:0.1:10];
c=(y0/sqrt(1-zeta^2));
y=c*exp(-zeta*wn*t).*sin(wn*sqrt(1-zeta^2)*t+acos(zeta));
bu=c*exp(-zeta*wn*t);bl=-bu;
subplot(2,2,1);
plot(t,y,t,bu,'--',t,bl,'--'), grid
xlabel('Time (s)'), ylabel('y(t) (m)')
legend(['\omega_n=',num2str(wn),' , \zeta=',num2str(zeta)])
% damping ratio = 0.6
y0 = 0.15;
zeta = 0.6;
wn = 1/(2*zeta);
t = [0:0.1:10];
c=(y0/sqrt(1-zeta^2));
y=c*exp(-zeta*wn*t).*sin(wn*sqrt(1-zeta^2)*t+acos(zeta));
bu=c*exp(-zeta*wn*t);bl=-bu;
subplot(2,2,2);
plot(t,y,t,bu,'--',t,bl,'--'), grid
xlabel('Time (s)'), ylabel('y(t) (m)')
legend(['\omega_n=',num2str(wn),' , \zeta=',num2str(zeta)])
% damping ratio = 1
y0 = 0.15;
zeta = 1;
wn = 1/(2*zeta);
t = [0:0.1:10];
c=(y0/sqrt(1-zeta^2));
y=c*exp(-zeta*wn*t).*sin(wn*sqrt(1-zeta^2)*t+acos(zeta));
bu=c*exp(-zeta*wn*t);bl=-bu;
subplot(2,2,3);
plot(t,y,t,bu,'--',t,bl,'--'), grid
xlabel('Time (s)'), ylabel('y(t) (m)')
legend(['\omega_n=',num2str(wn),' , \zeta=',num2str(zeta)])

%%Q2 :
num1=[1];den1=[1 10];sysg1=tf(num1,den1);
num2=[1];den2=[1 1];sysg2=tf(num2,den2);
num3=[1 0 1];den3=[1 4 4];sysg3=tf(num3,den3);
num4=[1 1];den4=[1 6];sysg4=tf(num4,den4);
numh1=[1 1];denh1=[1 2];sysh1=tf(numh1,denh1);
numh2=[2];denh2=[1];sysh2=tf(numh2,denh2);
numh3=[1];denh3=[1];sysh3=tf(numh3,denh3);
sys1=sysh2/sysg4;
sys2=series(sysg3,sysg4);
sys3=feedback(sys2,sysh1,+1);
sys4=series(sysg2,sys3);
sys5=feedback(sys4,sys1);
sys6=series(sysg1,sys5);
sys=feedback(sys6,sysh3)

%%Q3 :
num = [5400];
den = [2 2.5 5402];
sys = tf(num,den);
t=[0:0.005:3];
[y,t]=step(sys,t);
subplot(2,2,4);
plot(t,y),grid
xlabel("Time(s)")
ylabel("Wheel velocity")
