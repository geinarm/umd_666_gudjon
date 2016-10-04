function b = findrhsvector(n)
% find rhs vector b for normal equations
% for u(x) = sin(x*2/pi), functions 1,x,...,x^n-1

b = zeros(n,1);              
                             % let alpha_j = integral(x^j*cos(2/pi*x)), 
                             %      beta_j = integral(x^j*sin(2/pi*x))
alpha = 2/pi; beta = 2/pi;   % values for j=0
for j=1:n

  b(j) = beta;
  beta_new = j*2/pi*alpha;   % use integration by parts to compute alpha_j, beta_j from alpha_{j-1},beta_{j-1}
  alpha_new = 2/pi - j*2/pi*beta;
  alpha = alpha_new; beta = beta_new;
end
