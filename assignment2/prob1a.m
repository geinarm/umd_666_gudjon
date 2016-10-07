
n = 10;                         % Number of interpilation points
np = 1000;                      % Number of points to plot with
u = @(t) (1./(1.1 - cos(t)));   % function u(t), even, 2Pi periotic

j = 0:n;
jp = 0:np-1;
%j_extended = 0:2*n-1;
%jp_extended = 0:2*np-1; 

t = j'*pi/n;
tp = jp*(pi/np);
%t_extended = j_extended'*pi/n;
%tp_extended = jp_extended'*pi/np;

U = u(t);      % Evaluate u(t) [0, pi]
a = cos_transform(U);
K = np-n;
ap = [a;zeros(K,1)];       % extend a vector with K zeros
Up = inv_cos_transform(ap);

%utp = u(tp);
%utp_extended = u(tp_extended);

%% plot u(t)
plot(tp, u(tp), '-', 'color', 'blue'); hold on; % Plot function u(t)
plot(t, U, 'o', 'color', 'black');              % Plot interpolation points
plot(tp, Up, '-', 'color', 'red');              % Plot function p(t)

xlabel('t');
legend('u(t)', 'interpolation points', 'p(t)','Location','northeast')
axis tight;
hold off;

