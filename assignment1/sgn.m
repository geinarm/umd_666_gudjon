function [y] = sgn(x)
	y = (x > 0) - (x < 0);