
n = 6;
np = 1000;

j = 0:n;
j_extended = 0:2*n-1;
jp = 0:np-1;
jp_extended = 0:2*np-1; 

t = j'*pi/n;
t_extended = j_extended'*pi/n;
tp = jp*(pi/np);
tp_extended = jp_extended'*pi/np;

U = (1./(1.1 - cos(t)));
U_extended = [U; flip(U(2:end-1))];

%Ue = [U;flip(U(2:end-1))];
%te = (0:2*n-1)'*2*pi/(2*n-1);
%tep = (0:2*np-1)'*2*pi/(2*np-1);

[a,b] = cossin_transform(U_extended);
K = (np*2-2*n)/2;
ap = [a;zeros(K,1)];       % extend a and b vector with K zeros
bp = [b;zeros(K,1)]; 
Up = inv_cossin_transform(ap,bp);

utp = 1./(1.1 - cos(tp));
utp_extended = 1./(1.1 - cos(tp_extended));

%pt = zeros(np*2, 1);
%for i = 1:np*2
%    sum = 0;
%    for k = 1:n+1
%       sum = sum + a(k)*cos((k-1)*tep(i));
%    end
%    pt(i) = sum;
%end

% plot u(t)

%plot(t_extended, U_extended, 'o', 'color', 'red');
%plot(tp_extended, utp_extended, '-', 'color', 'red');
plot(tp, utp, '-', 'color', 'blue'); hold on;
plot(t, U, 'o', 'color', 'black');
plot(tp, Up(1:1000), '-', 'color', 'red');
%plot(tp_extended, Up, '-', 'color', 'green');
hold off;
%plot(tep, pt, '-', 'color', 'green');
%plot(t, U, 'o', 'color', 'red');
%plot(te, Ue, 'o', 'color', 'red');

%legend({'u(t)', 'p(t)', 'Points'});

