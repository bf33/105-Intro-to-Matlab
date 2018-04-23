function Y = HeunsMethod(f,h,xi,xf,y0)
% By: Blake Franklin
% Uses Heun's Method in order to estimate function values
% of a differential equation
% Inputs: 
%   f = the function's derivative (ODE)
%   h = step size
%   xi = left bound (of interval you want)
%   xf = right bound
%   y0 = initial condition (function value at xi)
% Output:
%   Y = array of function values over the interval at
%   the specific steps. The first value of Y is the
%   initial condition. (So that you can plot all values)

Yprecat=zeros(1,abs((xf-xi)/h));
Y=cat(2,y0,Yprecat);
x=xi:h:xf;
iters=size(x,2)-1;
for i=1:iters
    deltaY1=f(x(i),Y(i));
    Y2=Y(i)+h*deltaY1;
    deltaY2=f(x(i)+h,Y2);
    deltaYheun=(deltaY1+deltaY2)/2;
    Y(1,i+1)=Y(1,i)+h*deltaYheun;
end
end