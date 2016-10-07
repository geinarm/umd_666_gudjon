
N = 2:2:20;
E = zeros(1, length(N));

for j = 1:length(N)
    n = N(j);
    E(j) = interperr_eq(n);
end

C = 1;
alpha = -0.29;
D = C*exp(alpha*N);

%% Plot error
plot(N, E, '-o'); hold on;
plot(N, D);
axis tight;
xlabel('n');
ylabel('Error');
legend('E_n', 'Ce^{\alphan}','Location','northeast')

hold off;