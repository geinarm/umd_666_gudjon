j = 0:1000;

t = j*(pi/1000);
ut = 1./(1.1 - cos(t));

plot(t, ut);