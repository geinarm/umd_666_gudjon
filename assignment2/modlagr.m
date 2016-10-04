function ye = modlagr(x,y,xe)
% ye = modlagr(x,y,xe)
% find interpolating polynomial for data x,y and evaluate at points xe
% input:
%   vectors x,y: given data points
%   vector xe:   evaluation points
% output: 
%   vector ye: values of interpolating polynomial at points xe

% uses modified Lagrange formula - see notes on web page

% compute w_j
x = x(:);                     % turn x into column vector
n = length(x);
w = zeros(n,1);
w(1) = 1;                     % initialize w_1
for j=2:n;                    % add new point x_j
   v = x(1:j-1) - x(j);
   w(1:j-1) = v.*w(1:j-1);    % update old w-values
   w(j) =  prod(-v);          % new w_j
end
w = 1./w;

% evaluate modified Lagrange formula
s = zeros(size(xe));
P = ones(size(xe));
equalnode = zeros(size(xe));  
for j=1:n
  d = xe - x(j);
  equalnode(d==0) = j;        % where xe coincides with node: store node number
  s = s + y(j)*w(j)./d;      
  P = P.*d;
end
ye = P.*s;                    % get 0/0=NaN where xe coincides with node

% fix ye for xe-values which coincide with nodes!
ind = (equalnode>0);          % indices where ye is 0/0 = NaN
ye(ind) = y(equalnode(ind));  % replace with nodal values