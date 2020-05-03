  % The AR(1) model is as follows: c0 + c1*y_t = y_t+1

  data = xlsread('google_stock');		% read and import data from the google_stock.xlsx file
  data(1:10)					% verification of data vector
  plot(data)					% plots the stock prices over the total number of rows

  %Form: A*beta = b;
  % Creating the A matrix:

  d = data(1:104);
  A = [ones(104,1) d];
  b = data(2:105);

  beta = A\b
  y_pred = A * beta;

  hold on
  ylabel('Price')
  xlabel('Input')
  plot(y_pred)
  title('Q1: Google Stock AR(1) Model')

  sse = (b - y_pred)' * (b - y_pred);		% SSE = error' * error; MSE = SSE/size(y_pred);
  b_tilde = b - mean(b);
  sst = b_tilde' * b_tilde;
  r_squared = 1 - (sse/sst)

  %% end of question 1 %%

  data = xlsread('earthquake');

  col2 = data(:, 2);
  plot(col2)
  hold on

  b = col2(3:100);
A = [];
for i = 1:98
	A = [A; col2(i) col2(i+1)];
end
A = [ones(98,1) A];

  beta = A\b;
  beta

  y_pred = A * beta;
  plot(y_pred)
  xlabel('Year')
  ylabel('Quakes')
  title('Q2: USGS Earthquake AR(2) Model')
  
  sse = (b - y_pred)' * (b - y_pred)
 
  % implementing polyfit:
  b_tilde = b - mean(b);
  sst = b_tilde' * b_tilde;
  r_squared = 1 - (sse/sst)

  %% end of question 2.1 %%

  data = xlsread('earthquake');
  col2 = data(:, 2);
  plot(col2)
  hold on

  b = col2(4:100);
  A = [];
for i = 1:97
	A = [A; col2(i) col2(i+1) col2(i+2)];
end
  A = [ones(97,1) A];

  beta = A\b
  y_pred = A * beta;

  xlabel('Year')
  ylabel('Quakes')
  title('Q2: USGS Earthquake AR(3) Model')
  plot(y_pred)

  sse = (b - y_pred)' * (b - y_pred)
  b_tilde = b - mean(b);
  sst = b_tilde' * b_tilde
  r_squared = 1 - (sse/sst)

  %% end of question 2 %%

data = dlmread('shipment.txt');                 % read and import data from the shipment.txt file

% splitting the columns into 2 vectors
x1_size = data(:, 2);
y_cost = data(:, 1);

scatter(x1_size, y_cost)
hold on
polyfit(x1_size, y_cost, 1);
 
lin_x = linspace(min(x1_size),max(x1_size));	
lin_y = ans(2) + ans(1)*lin_x;

plot(lin_x, lin_y)

A = [ones(10, 1) x1_size];

% the d matrix contains the 3rd column vector
d = [];
for i = 1:10
    d = [d; max(0, x1_size(i) - 250)];
end

% setting up the A matrix:
A = [A d];

% solving the system
beta = A \ y_cost
 
% finding the first piece of the function
 
col2 = A(:, 2);

% implementing the max function
col2 = col2(col2 < 250);

A_2 = [ones(6, 1) col2];
beta2 = beta(1:2, 1)
y2_pred = A_2 * beta2;
plot(col2, y2_pred)
 
% finding the second piece of the function
 
col3 = x1_size(x1_size >= 250)
A_3 = [ones(4, 1) col3 d(d > 1)]
y3_pred = A_3 * beta
plot(col3, y3_pred)
 
xlabel('Size(in thousand parts)')
ylabel('Cost(in thousand dollars)')
title('Q3: Shipment Data Set')

% Alternative to the polyfit function, the following could have been done:

% x1_tilde = x1_size - mean(x1_size);
% y_tilde = y_cost - mean(y_cost);
% rho = ((x1_tilde)' * (y_tilde))/(norm(x1_tilde) * norm(y_tilde));
% c2 = rho * (std(y_cost)/std(x1_size));
% c1 = mean(y_cost) - mean(x1_size)*c2;
