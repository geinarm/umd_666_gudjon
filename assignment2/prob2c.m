
np = 1000;                      % Number of points to plot with
u1 = @(x) abs(x).^(1/3);
u2 = @(x) abs(x+1).^(1/3);

N = 2:2:20;
E = zeros(1, length(N));

%%U1
% Estimate error for each p_n(t)
for j = 1:length(N)
    n = N(j);
    E(j) = interperr_ch_f(n, u1);

    if j > 1
        dx = log(n) - log(n-2);
        dy = log(E(j)) - log(E(j-1)); 
        S = dy/dx;
        fprintf('N: %d  E: %0.5g  S: %0.5g\n', n, E(j), S);
    end
end

C = 0.77;
alpha = 0.32529
D = C*N.^-alpha;

%% Plot error
plot(log(N), log(E), '-o', 'color', 'blue'); hold on;
plot(log(N), log(D), 'color', 'red');
axis tight;
xlabel('log n');
ylabel('log E_n');
legend('log E_n' ,'Location','northeast')

hold off;

pause;
%%U2
% Estimate error for each p_n(t)
for j = 1:length(N)
    n = N(j);
    E(j) = interperr_ch_f(n, u2);

    if j > 1
        dx = log(n) - log(n-2);
        dy = log(E(j)) - log(E(j-1)); 
        S = dy/dx;
        fprintf('N: %d  E: %0.5g  S: %0.5g\n', n, E(j), S);
    end
end

C = 0.55;
alpha = 0.66444
D = C*N.^-alpha;

%% Plot error
plot(log(N), log(E), '-o', 'color', 'blue'); hold on;
plot(log(N), log(D), 'color', 'red');
axis tight;
xlabel('log n');
ylabel('log E_n');
legend('log E_n' ,'Location','northeast')

hold off;