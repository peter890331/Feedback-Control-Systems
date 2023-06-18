format short

%1. Basic Arithmetic
x = [2 1+2i; -0.45 5];
z1 = (1/2)*log(x+sqrt(1+x.^2))+eye(2)

%2. Matrix/Vector
A = [12 34 -4; 34 7 87; 3 65 7];
B = [1 4 7; 2 5 8; 3 6 9];
z2 = A * B
z3 = A.* B
z4 = A^3
z5 = A.^3
z6 = [A([1,3],:);B^2]
z7 = eig(B)
z8 = det(A)

%3. Equation Solving
a = [1/2 1/3 1/4; 1/3 1/4 1/5; 1/4 1/5 1/6];
b = [0.95; 0.67; 0.52];
x = inv(a)*b;
x1_052 = x(1)
x2_052 = x(2)
x3_052 = x(3)
b = [0.95; 0.67; 0.53];
x = inv(a)*b;
x1_053 = x(1)
x2_053 = x(2)
x3_053 = x(3)

%4. Loop statement
format rat
H = zeros(9,9);
for i = 1:9
    for j = 1:9
        H(i,j) = 1/(i+j-1);
    end
end
H

%5. Plot
%Eq1:
subplot(1,2,1);
fplot(@(x) -sqrt(cos(x))+3, [-pi/2,pi/2]);
title('-sqrt(cos(x))+3');
xlabel('x');
%Eq2:
subplot(1,2,2);
syms x y
f(x,y) = ((x.^2)/(2^2))-((y.^2)/(4^2));
ezplot(((x.^2)/(2^2))-((y.^2)/(4^2)), [-2, 2, -4, 4]);
