
np = 1000;                      % Number of points to plot with
u = @(t) (1./(1.1 - cos(t)));   % function u(t), even, 2Pi periotic
tp = (0:np-1)'*(pi/np);

N = (2:2:50);
E = zeros(1, length(N));

%% Estimate error for each p_n(t)
for j = 1:length(N)
    n = N(j);
    t = (0:n)'*pi/n;
    U = u(t);
    
    a = cos_transform(U);
    K = np-n;
    ap = [a;zeros(K,1)];
    
    Pt = inv_cos_transform(ap);
    Ut = u(tp);
    E(j) = max(abs(Pt - Ut));
    
    if j > 1
        S = log(E(j)) - log(E(j-1));
        fprintf('N: %d  E: %0.5g  S: %0.5g\n', n, E(j), S);
    end
end

%% Plot error
plot(N, log(E), '-o', 'color', 'blue');
axis tight;
xlabel('n');
ylabel('Log E_n');
