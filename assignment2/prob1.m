
u = @(t) (1/(1.1 - cos(t)));
n = 10;
np = 1000;

j = 0:n;
t = j'*pi/n;

U = (1./(1.1 - cos(t)));
Ue = [flip(U(3:end));U];
te = [-flip(t(3:end));t];

[a,b] = cossin_transform(Ue);
K = (np-2*n)/2;
ap = [a;zeros(K,1)];       % extend a and b vector with K zeros
bp = [b;zeros(K,1)]; 
Up = inv_cossin_transform(ap,bp);

Utest = zeros(np, 1);
for i = 1:np
    sum = 0;
    for k = 1:n+1
       sum = sum + a(k)*cos(k*tp(i));
    end
    Utest(i) = sum;
end

% plot u(t)
hold off;
jp = 0:np-1;
tp = jp*(pi/np);
utp = 1./(1.1 - cos(tp));

plot(tp, utp, '-'); hold on;
plot(t, U, 'o');
plot(te, Ue, 'o');
plot(tp, Up, '-');
plot(tp, Utest, '-');
