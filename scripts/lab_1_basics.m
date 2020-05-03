a = ones(4)
b = rand(4)
c = [2 3 4]
d = [2 3 4; 5 6 7; 8 9 10]

a = rand(1, 4)
a = [a c]

randi(4)
randi(5) % returns a pseudorandom scalar integer between 1 and n.
randi(10, 4) % returns an n-by-n matrix of pseudorandom integers drawn from the discrete uniform distribution on the interval [1,n].
randi(10, 4, 1) % randi(10,3,4) returns a 3-by-4 array of pseudorandom integers between 1 and 10.

x = [1 2 3]; y = [5 5 5]; 
s = x + y

m = x .* y

matmul = x' * y
dotprod = x * y'
e = x.^2

b(2)
b(5) % goes column-by-column
size(b)
[r, c] = size(b)

b = b'

sum(b)
b(:, 1) % selects all the rows from the first column
sum(b(:, 1)) % sums all the rows from the first column

mean(b(:,1))
b(1, :)

sum(b(2,:))
sum(b,2) % calculates the sum of the elements in each row

mean(b, 2)