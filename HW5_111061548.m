clear;
clc;
%Q1:
K=[0:0.1:5];
for i=1:length(K)
 num1=[1]; den1=[1 5 K(i)-3 K(i)];
 sys1=tf(num1,den1);
 sysf1=feedback(sys1,[1]);
 p(:,i)=pole(sysf1);
end
figure(1);
plot(real(p),imag(p),'x'), grid
hold on
text(-0.2,1.3,'K=5'); text(0,0.2,'K=0'); text(-0.9,0.95,'K=4','color','r')
plot([0,0],[-1.5,1.5], Color = 'black')
plot([-6,1],[0,0], Color = 'black')
hold off
title('Q1: closed-loop transfer function poles')
fprintf('Q1: \n')
fprintf('With the Routh-Hurwitz method, we can determine the maximum range of K for stability is that k>4. \n')
Kis4=4;
denkis4=[1 5 Kis4-3 Kis4]; syskis4 = tf(num1,denkis4);
sysfkis4 = feedback(syskis4,[1]);
fprintf('The roots of the characteristic equation when K is 4:\n')
pole(sysfkis4)

%Q2:
A2=[0 1 0;0 0 1;-5 -12 -8]; B2=[0;0;1]; C2=[1 1 0]; D2=[0];
sys2=ss(A2,B2,C2,D2);
fprintf('Q2(a): the characteristic equation \n')
p2=poly(A2)
fprintf('Q2(b): the roots of the characteristic equation \n')
roots(p2)
fprintf('the system is stable because all root are negative. \n')
t2=[0:0.1:5];
figure(2)
y2=step(sys2,t2);
plot(t2,y2), grid
title('Q2(c): unit step response')

%Q3:
num3_1=[21]; den3_1=[1 0]; 
sys3_1=tf(num3_1,den3_1);
num3_2=[1]; den3_2=[1 2]; 
sys3_2=tf(num3_2,den3_2);
sys3=series(sys3_1,sys3_2);
sysf3=feedback(sys3,[1]);
fprintf('Q3:\n')
transfer_function=sysf3
Wn=sqrt(21)
zeta=1/Wn
PO=100*exp((-zeta*pi)/(sqrt(1-zeta^2)))
fprintf('Q3(a):\n')
fprintf('By analytical, we can found that the P.O. is '+string(PO)+', approximately 50 percent, \n')
t3=[0:0.1:5];
y3=step(sysf3,t3);
figure(3)
plot(t3,y3), grid
title('Q3(b): unit step response')
fprintf('Q3(b):\n')
fprintf('and by the plot, we can found that the P.O. is '+string(stepinfo(sysf3).Overshoot)+', approximately 50 percent too.')