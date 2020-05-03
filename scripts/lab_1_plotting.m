x = -2:.5:2
x = linspace(-2, 2, 9) % last argument = number of points generated

y = 2*x + 1 % 2*x -> scalar-vector multiplication 

plot(x, y)
axis square

axis([-5 5 -10 20])
axis([-5 5 -10 20]) % [lower_x upper_x lower_y upper_y]
xlabel('input')
ylabel('output')
title('y = 2*x + 1')
z = x.^2

hold on
plot(x,z, 'r-')
x = linspace(-50,50);
y = 2*x.^3 + 4*x + 1;
plot(x, y, 'g-')
hold off
plot(x, y, 'g-')

% subplots
subplot(2, 2, 1)
plot(x,y)
title('(a)')
subplot(2, 2, 4)

[x, y] = meshgrid(-2:2, -2:2)
z = x.*exp(-x.^2-y.^2);
surf(x, y, z)
[x, y] = meshgrid(-3:3, -3:3)

z = 1 - y - x
surf(x, y, z)



