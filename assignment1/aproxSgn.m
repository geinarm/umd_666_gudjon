
n = 15;			             % find approximation with polynomial of degree <=n-1

M = findmatrix(n);           % see separate m-files findmatrix.m, findrhsvector.m
%b = findrhsvector(n);

b = zeros(n, 1);
for j=1:n
	b(j) = 1/(j+1);
end
%b = [0.5, 1/3]';

c = M\b;                      % find c by solving the normal equations

N = 1000;                    % find L2-error approximatively using midpoint rule with N subintervals
x = ((-N/2:N/2 -1)'-.5)/N;           % midpoints of subintervals
x = x*2;
%ux = sin(pi/2*x);            % values of u(x)
ux = sgn(x);

%px = ones(N,1)*c(n);         % evaluate p(x) using nested multiplication
%for j=n-1:-1:1
%  px = px.*x + c(j);
%end

px = zeros(N,1);
for j=1:n
	px = px + c(j) * (x.^(j-1));
end

figure(1)
plot(x,ux,x,px);
axis tight; legend('u(x)','p(x)','Location','best')
title('function u(x) with least squares approximation p(x)')

ex = px - ux;
figure(2)
plot(x,ex)                   % plot error e(x) = p(x)-u(x)
axis tight; grid on; title('error p(x)-u(x)')

L2error = sqrt( sum(abs(ex).^2)/N )   % approximate L2-error ||u-p|| using midpoint rule