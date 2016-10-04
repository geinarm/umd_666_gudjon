function M = rankk(A, k)

M = zeros(size(A));
[U,S,V] = svd(A);
sigma = diag(S);

for i=1:k
	M = M + sigma(i) * U(:, i) * V(:, i)';
end