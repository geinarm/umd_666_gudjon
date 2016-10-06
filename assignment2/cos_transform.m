function a = cos_transform( U )

n = length(U)-1;

U_extended = [U; flip(U(2:end-1))];

j = 0:n;
j_extended = 0:2*n-1;

t = j' *pi/n;
t_extended = j_extended'*pi/n;


c = fft(U_extended)./length(U_extended);
a = [c(1); c(2:n)+c(end:-1:n+2); c(n+1)];   % cosine coefficients a_0,...,a_n

end

