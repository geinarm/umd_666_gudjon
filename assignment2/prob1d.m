
n = 8;                      % Number of nodes
np = 1000;                  % Number of points to plot with

t = (0:n)' *pi/n;
x = cos(t);                 % Chebyshev nodes
v = @(x) abs(x) ./3;        % Function v(x)

tp = (0:np-1)' *(pi/np);
xp = cos(tp);

V = v(x);                   % Evaluate v(x) at Chebyshev nodes
c = cos_transform(V);
K = np-n;
cp = [c;zeros(K,1)];        % extend c vector with K zeros
Vp = inv_cos_transform(cp);

%% plot
plot(xp, v(xp), '-', 'color', 'blue'); hold on; % Plot function v(x)
plot(x, V, 'o', 'color', 'black');              % Plot interpolation points
plot(xp, Vp, '-', 'color', 'red');              % Plot function p(t)

xlabel('t');
legend('v(x)', 'interpolation points', 'p(x)','Location','southeast')
axis tight;
hold off;