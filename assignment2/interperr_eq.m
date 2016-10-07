function err = interperr_eq( n )
    np = 1000;                      % Number of points to plot with
    u = @(x) (1./(1+30*x.^2));      % function u(x)

    x = -1 + (0:n)' *2/n;
    xp = -1 + (0:np-1)' *2/np;

    U = u(x);                       % Evaluate u(x)
    Px = modlagr(x, U, xp);
    Ux = u(xp);

    err = max(abs(Px - Ux));
end

