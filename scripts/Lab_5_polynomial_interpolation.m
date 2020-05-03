V = [1 -1.1 (-1.1)^2 (-1.1)^3]

V = [1 -1.1 (-1.1)^2 (-1.1)^3; 1 -0.4 (-0.4)^2 (-0.4)^3; 1 0.1 0.1^2 0.1^3; 1 0.8 0.8^2 0.8^3]

p = [-1.1; -0.4; 0.1; 0.8]

V = ones(4, 1)
V = [V p p.^2 p.^3]

b = [5; 6; 4; 8]

x = V\b
c = V\b

x = linspace(-2, 2, 10);
y = c(1) + c(2) * x + c(3) * x.^2 + c(4) * x.^3;
plot(x,y)
hold on
plot([-1.1 -0.4 0.1 0.8], [5 6 4 8], '+')

x = linspace(-1.5, 1, 10);
y = c(1) + c(2) * x + c(3) * x.^2 + c(4) * x.^3;
hold off
plot(x,y)
hold on
plot([-1.1 -0.4 0.1 0.8], [5 6 4 8], '+')
c

W = inv(V)
Wprime = W(:,1)

% Lagrange Polynomial: b1 L1(x) + b2 L2(x) + b3 L3(x) + b4 L4(x);
L1 = Wprime
L2 = W(:,2)
L3 = W(:,3)
L4 = W(:,4)


