f= @(x) x^3 - x^2 - 16*x +16
df= @(x) 3*(x^2) - 2*x - 16

a= -0.5;
b=1.5;
x=a;
for i= 1:1:100
    x1= x - (f(x)/df(x));
    x=x1;
end

sol= x;
fprintf ('Approximate root is %.15f', sol)
  
a= -0.5;
b=1.5;
x=a;
er(5)=0;
for i= 1:1:5
    x1= x - (f(x)/df(x));
    x= x1;
    er(i) = x1-sol;
end
fprintf ('\nApproximate error is %.15f', er)