function M = findmatrix(n)
% Find Gram matrix M for functions 1,x,...,x^n-1 on [0,1]

M = zeros(n,n);              
for i=1:n
  for j=1:n
    M(i,j) = 1/(i+j-1);
  end
end
