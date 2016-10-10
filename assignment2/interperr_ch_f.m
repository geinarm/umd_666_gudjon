function err = interperr_ch_f( n, f )
    np = 1000;                      % Number of points to plot with

    t = (0:n)' *pi/n;
    tp = (0:np-1)' *pi/np;
    x = cos(t);
    xp = cos(tp);

    U = f(x);                       % Evaluate f(x)
    Px = modlagr(x, U, xp);
    Ux = f(xp);

    err = max(abs(Px - Ux));
end

