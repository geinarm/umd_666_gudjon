
N = 2:2:20;
E = zeros(1, length(N));

for j = 1:length(N)
    n = N(j);
    E(j) = interperr_ch(n);
end

C = 1;
alpha = -range(log(E)) / range(N);
D = C*exp(alpha*N);

%% Plot error
plot(N, log(E), '-o'); hold on;
plot(N, log(D));
axis tight;
xlabel('n');
ylabel('Log E_n');
legend('Log E_n', 'Log Ce^{\alphan}','Location','northeast')

hold off;