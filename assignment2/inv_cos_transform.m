function U = inv_cos_transform( a )
    n = length(a)-1;
    b = zeros(length(a)-2, 1);
    c = [a(1); a(2:end)/2; zeros(n-1,1)] + [zeros(n,1); a(end:-1:2)/2] + ...
         [0; b/2i; 0; -b(end:-1:1)/2i];

    U = ifft(c)*length(c);
    U = U(1:length(U)/2);       % remove extended part of the function
end

