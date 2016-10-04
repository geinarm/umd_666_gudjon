function [a,b] = cossin_transform(U)
% Discrete Fourier Transform, EVEN number of data points, return cosine and sine coefficients
%
% given: U, column vector of even length m=2*n 
%        contains function values at j*2*pi/m, j=0,...,m-1
% find: interpolating function p in T_n^{cos}:
%         p(t) = a_0 + a_1 cos(t) + ... + a_{n-1} cos((n-1)*t) + a_n cos(n*t)
%                    + b_1 sin(t) + ... + b_{n-1} sin((n-1)*t)
%      a is vector of length n+1
%      b is vector of length n-1


dft = @(u) fft(u)/length(u);    % Discrete Fourier Transform c = dft(U);
% dft: given fct values  [U_0,...,U_{m-1}]
%      find coefficients [c_0,...,c_{m-1}] such that
%         P(t) = c_0 + c_1*exp(i*t) + ... + c_{m-1}*exp(i*(m-1)*t)
%      interpolates:  P(j*2*pi/m) = U_j for j=0,...,m-1
%
% for even m=2*n: interpolating function p in T_n^{cos} is given by
%
% c_0 + c_1*exp(i*t) + ... + c_{n-1}*exp(i*(n-1)*t) 
%     + c_n*(exp(n*i*t) + exp(-n*i*t))/2 
%     + c_{n+1}*exp(-i*(n-1)*t) + ... + c_{2n-1}*exp(-i*t)

m = length(U); n = floor(m/2);
if 2*n~=m 
   error('vector U must have even length')
end
c = dft(U);

% cosine and sine coefficients: 
%  c_k*exp(i*k*t)+c_{-k}*exp(-i*k*t) = (c_k+c_{-k})*cos(k*t) + i*(c_k-c_{-k})*sin(k*t)
%                                    = a_k*cos(k*t) + b_k*sin(k*t)

a = [c(1); c(2:n)+c(end:-1:n+2); c(n+1)];   % cosine coefficients a_0,...,a_n
b = 1i*(c(2:n)-c(end:-1:n+2));              % sine coefficients b_1,...,b_{n-1}
