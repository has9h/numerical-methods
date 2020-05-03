A = [1 1 4; 1 3 -2; 1 3 2; 1 1 0]
b = [2; 0; 1; 8]

x = A\b
A*x

Q = [0.5 -0.5 0.5; 0.5 0.5 -0.5; 0.5 0.5 0.5; 0.5 -0.5 -0.5]
R = [2 4 2; 0 2 -2; 0 0 4]

inv(R) * transpose(Q)

pinv(A)
pinv(A) - inv(R) * transpose(Q)
xhat = R\(Q' * b)

[Q, R] = qr(A)

xhat2 = R\(Q' * b)
