function U = inv_cossin_transform(a,b)
% Inverse Discrete Fourier Transform: 
% given 
%    cosine coefficients: column vector [a_0;...;a_n] of of length n+1 
%    sine coefficients:   column vector [b_1;...;b_{n-1}] of length n-1
% find vector U of length m=2*n
%    function vaues at j*2*pi/m, j=0,...,m-1 

n = length(a)-1;
idft = @(u) ifft(u)*length(u);  % inverse function of dct

%% inverse operation: given cosine coefficients [a_0;...;a_n] find [U_0,...,U_n]
% a_k*cos(k*t) =  a_k/2*exp(i*k*t) + a_k/2*exp(-i*k*t) 
% b_k sin(k*t) =  b_k/(2i)*exp(i*k*t) - b_k/(2i)*exp(-i*k*t)

c = [a(1); a(2:end)/2; zeros(n-1,1)] + [zeros(n,1); a(end:-1:2)/2] + ...
     [0; b/2i; 0; -b(end:-1:1)/2i];
U = idft(c);
