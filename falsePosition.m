 function [root, fx, ea, iter]= falsePosition(func,xl,xu,es,maxiter)
% <---show/hide. By: BLAKE FRANKLIN
%
% Function will find the roots of an input equation
% using the false position (Newton-Raphson) method
% 
% Inputs: 
%  func = name of your function to evaluate
%  xl = lower bound
%  xu = upper bound
%  es = desired relative error (default is .0001%)
%  maxiter = # of iterations that this will perform, defaults to 200
% 
% Outputs:
%  ea= approximate relative percent error
%  iter= # of iterations performed
%  fx= function evaluated at root location

format long

if nargin<3  % All this is to make sure inputs are correct
    error('Enter correct inputs')
end
if nargin<4  
    es=.01;
    maxiter=200;
elseif nargin==4
    maxiter=200;
    disp('Make sure you entered es (desired % error), maxiter is 200 by default now')
end
test1=func(xl)*func(xu); % this makes sure a root is bracketed
if test1>0
    error('No sign change detected, choose new brackets')
end
% Next section iterates using the false position method
iter=0; 
xr=xl; %This starts xr as the lower bound
ea2=100; % starts the loop in my code

while ea2>es && iter<maxiter
    xrold=xr; % Do this to store old value before computations below
    xr= double(xu- (func(xu)*(xl-xu))/(func(xl)-func(xu)));
    % above is the only changed part from bisection
    iter= iter+1; %counter
    if abs(xr)>0  % this if statement is in case xr is guessed right off thebat
        ea=double(abs((xr-xrold)/xr)*100); % relative percent error
    else
        ea=0; % This will end the loop if xr = 0
    end
        % sign check for new xr value
    if sign(func(xr))>0  % Determines which way to go with the new bracket
        xu=xr;    % Positive xr means xu is moved closer to zero
    else
        xl=xr; 
    end        
    ea2=ea;    % <--MOAR VARIABLES
    
end
root=xr;
fx=func(xr);
iterationnumber= iter;
fprintf('%10.2f is the functions value at root=%10.2f, after %5.2f iterations. Relative percent error is %12.11f%', fx, root, iterationnumber,ea)
 % If you are reading this congratulations on going through my
 % complete rat nest of a code... 
end





    



