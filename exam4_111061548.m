clc;
clear;
close all;
%Q1:
G = tf(1,[1 12 36]);
figure(1)
k=0.05138888;
margin(k*G)

omega_c = 14.5;
a_dB = -73.6;
z = omega_c/10;
alpha = 10^(a_dB/20);
p = z/alpha;
Gc = tf([1 z],[1 p]);
L = k * (p/z) * Gc * G;
figure(2)
margin(L)

%Q2:
G = tf(18.75,[1 12 18.75]);
figure(3)
fprintf('Q2: P controller Gc(s):')
k = 8
margin(k*G) %P.M. = 55 deg

%Q3:
G = tf(1,[1 10]);
Gc = tf(85,[1 0]);
L = Gc * G;
figure(4)
margin(L) %P.M. = 55.1 deg
T = feedback(L,1);
fprintf('Q3: PO: \n')
stepinfo(T) %P.O. = 13.1612

%Q4:
G = tf([1 2],[1 6 14 8]);
figure(5)
rlocus(G) %Q4(1)
zeta = 0.707;
sgrid(zeta,10^3);
fprintf('Q4(2):')
k = 3.18 %zeta = 0.707

%Q5:
G = tf([20 20],[1 2 25 0]);
z = 1;
p = 25;
Gc = tf([1 z],[1 p]);
L = G * Gc;
figure(5)
rlocus(L)
zeta = 0.6901067306; %P.O. <= 5%
fprintf('Q5: PO:')
PO(zeta) %P.O. <= 5%
sgrid(zeta,10^3);
k = 100;
L = k * G * Gc;
T = feedback(L,1);
fprintf('Q5: Ts:')
stepinfo(T) %Ts <= 5s
fprintf('Q5: the compensator Gc(s):')
k * Gc

%Q6:

%Q7:
G = tf([0.2],[6 7 1 0]);
figure(6)
margin(G)
phi_m = 40-40-5;
phi_m = phi_m*pi/180;
alpha = (1+sin(phi_m))/(1-sin(phi_m));
wm = 0.148;
p = wm*alpha^0.5;
z = p/alpha;
Gc = tf([1 z],[1 p]);
L = (p/z) * G * Gc;
figure(7)
margin(L) %P.M. = 37.1 deg

%Q8:
G = tf(1,[1 4 3]);
figure(8)
margin(G)
z = 22.4;
Gc = tf([1 z],[1]);
L = Gc * G;
figure(9)
margin(L) %P.M. = 59.1 deg
fprintf('Q8: Kp = 0.08928 \n')

function y = PO(x)
    y = exp(-pi*x/sqrt(1-x^2));
end




