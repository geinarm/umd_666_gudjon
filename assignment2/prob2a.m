
N = 2:2:20;
E = zeros(1, length(N));

for j = 1:length(N)
    n = N(j);
    E(j) = interperr_eq(n);
end

C = 0.4;% abs(min(E)) %0.21;
alpha = (range(log(E))) / range(N);
%alpha = 0.27;
D = C*exp(alpha*N);

%% Plot error
plot(N, log(E), '-o', 'color', 'blue'); hold on;
plot(N, log(D), 'color', 'red');
axis tight;
xlabel('n');
ylabel('Log E_n');
legend('Log E_n', 'Log Ce^{\alphan}','Location','southeast')

hold off;