clear;clc;
%Q1(a):
numa = [1];
dena = [0.75 3.25 1];
sysa = tf(numa,dena);
[MAG, PHASE] = bode(sysa);
PHASEa = PHASE(1,:);
MAGa = MAG(1,:);
figure(1);
subplot(2,2,1)
polar(PHASEa*pi/180, MAGa)
title('Q1(a): polar plot')

%Q1(b):
numb = [5 7 5];
denb = [1 -2 1];
sysb = tf(numb,denb);
[MAG, PHASE] = bode(sysb);
PHASEb = PHASE(1,:);
MAGb = MAG(1,:);
subplot(2,2,2)
polar(PHASEb*pi/180, MAGb)
title('Q1(b): polar plot')

%Q1(c):
numc = [1 -8];
denc = [1 6 8];
sysc = tf(numc,denc);
[MAG, PHASE] = bode(sysc);
PHASEc = PHASE(1,:);
MAGc = MAG(1,:);
subplot(2,2,3)
polar(PHASEc*pi/180, MAGc)
title('Q1(c): polar plot')

%Q1(d):
numd = [20 160];
dend = [1 6 8 0];
sysd = tf(numd,dend);
[MAG, PHASE] = bode(sysd);
PHASEd = PHASE(1,:);
MAGd = MAG(1,:);
subplot(2,2,4)
polar(PHASEd*pi/180, MAGd)
title('Q1(d): polar plot')

%Q2:
controller = tf([0.5 1],[1]);
valve = tf([0.2 0.02],[84 19 1]);
process = tf([10],[3 1 0]);
measurement = tf([20],[1 5 12]);
fprintf('Q2: loop transfer function')
sys2 = controller * valve * process * measurement
figure(2);
bode(sys2)
title('Q2: bode plot of loop transfer function')

%Q3(a):
num3a = [1];
den3a = [0.75 3.25 1];
sys3a = tf(num3a,den3a);
[MAG, PHASE] = bode(sys3a);
PHASE3a = PHASE(1,:);
MAG3a = MAG(1,:);
figure(3);
subplot(2,1,1);
plot(PHASE3a,20*log10(MAG3a));
set(gca,'xDir','reverse');
title('Q3(a): logarithmic-magnitude versus phase angle curve')
xlabel('phase(Deg)')
ylabel('logarithmic-magnitude(dB)')

%Q3(b):
num3b = [5 7 5];
den3b = [1 -2 1];
sys3b = tf(num3b,den3b);
[MAG, PHASE] = bode(sys3b);
PHASE3b = PHASE(1,:);
MAG3b = MAG(1,:);
subplot(2,1,2);
plot(PHASE3b,20*log10(MAG3b));
title('Q3(b): logarithmic-magnitude versus phase angle curve')
xlabel('phase(Deg)')
ylabel('logarithmic-magnitude(dB)')

%Q4(a):
fprintf('------------------------------------------------------\n')
num4a = [1];
den4a = [1 0.2];
sys4a = tf(num4a,den4a);
figure(4);
nichols(sys4a,{0,inf}),ngrid
[GM_4a,PM_4a] = margin(sys4a);
GM_4a = 20*log10(GM_4a);
hold on
plot([-180,-180+PM_4a],[0,0], Color = 'red')
text(-150,-2,'PM='+string(PM_4a), Color = 'red')
hold off
title('Q4(a): Nichols chart')
fprintf('Q4(a): \n')
fprintf('GM of Q4(a) is '+ string(GM_4a) +'\n')
fprintf('PM of Q4(a) is '+ string(PM_4a) +'\n')

%Q4(b):
num4b = [1];
den4b = [1 2 1];
sys4b = tf(num4b,den4b);
figure(5);
nichols(sys4b,{0,inf}),ngrid
[GM_4b,PM_4b] = margin(sys4b);
GM_4b = 20*log10(GM_4b);
hold on
plot([-180,0],[0,0], Color = 'red')
text(-90,4,'PM='+string(PM_4b), Color = 'red')
hold off
title('Q4(b): Nichols chart')
fprintf('Q4(b): \n')
fprintf('GM of Q4(b) is '+ string(GM_4b) +'\n')
fprintf('PM of Q4(b) is '+ string(PM_4b) +'\n')

%Q4(c):
num4c = [6];
den4c = [1 6 11 6];
sys4c = tf(num4c,den4c);
figure(6);
nichols(sys4c,{0,inf})
[GM_4c,PM_4c] = margin(sys4c);
GM_4c = 20*log10(GM_4c);
hold on
plot([-180,-180-PM_4c],[0,0], Color = 'red')
text(-100,4,'PM='+string(PM_4c), Color = 'red')
plot([-180,-180],[-GM_4c,0], Color = 'red')
text(-230,-10,'GM='+string(GM_4c), Color = 'red')
hold off
title('Q4(c): Nichols chart')
ngrid
fprintf('Q4(c): \n')
fprintf('GM of Q4(c) is '+ string(GM_4c) +'\n')
fprintf('PM of Q4(c) is '+ string(PM_4c) +'\n')

%Q5:
fprintf('------------------------------------------------------\n')
num5 = [1 2];
den5 = [1 6 14 8];
sys5 = tf(num5,den5);
figure(7);
rlocus(sys5),sgrid
title('Q5: Root Locus')
fprintf('Q5: \n')
fprintf('zeta=0.707, when K=3.18 \n')

%Q6:
fprintf('------------------------------------------------------\n')
num5 = [1 -1];
den5 = [1 4 5 4];
sys5 = tf(num5,den5);
figure(8);
rlocus(sys5),sgrid
title('Q6: Root Locus')
fprintf('Q6: \n')
Gm6_stable = margin(sys5)
fprintf('the system will be stable when 0<p<4 \n')