function G = findGram(M)

n = size(M, 2);
G = zeros(n,n);
for i=1:n
  for j=1:n
    G(i,j) = M(:, i)' * M(:, j);
  end
end