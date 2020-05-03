% define your function f
f = @(x,y) x.*exp(-x.^2 - y.^2);

[X,Y] = meshgrid(-2:.2:2);
Z = f(X,Y);

figure
surf(X,Y,Z)
xlabel('x-axis')
ylabel('y-axis')
zlabel('f(x,y)')

figure
mesh(X,Y,Z)
xlabel('x-axis')
ylabel('y-axis')
zlabel('f(x,y)')

figure
stem3(X,Y,Z,'MarkerFaceColor','g')
xlabel('x-axis')
ylabel('y-axis')
zlabel('f(x,y)')

figure
surface(X,Y,Z)
xlabel('x-axis')
ylabel('y-axis')

% contour and gradient field
figure
contour(X,Y,Z)
xlabel('x-axis')
ylabel('y-axis')
hold on

% uses central differences to compute gradient
[DX,DY] = gradient(Z,.2,.2); quiver(X,Y,DX,DY)
hold off
