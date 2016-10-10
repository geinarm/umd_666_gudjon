function err = interperr_ch( n )
    np = 1000;                      % Number of points to plot with
    u = @(x) (1./(1+30*x.^2));      % function u(x)

    t = (0:n)' *pi/n;
    tp = (0:np-1)' *pi/np;
    x = cos(t);
    xp = cos(tp);

    U = u(x);                       % Evaluate u(x)
    Px = modlagr(x, U, xp);
    Ux = u(xp);

    err = max(abs(Px - Ux));


%% plot u(t)
plot(xp, Ux, '-', 'color', 'blue'); hold on; % Plot function u(t)
plot(x, u(x), 'o', 'color', 'black');              % Plot interpolation points
plot(xp, Px, '-', 'color', 'red');              % Plot function p(t)
hold off;
end

