function I = Simpson(x,y)
% By: Blake Franklin
% Goal: estimate integral from x -> y using 
%   Simpson's 1/3 rule, and trapezoidal rule if there 
%   are an odd number of intervals in x and y.
% Inputs: x - Independent variable array
%         y - Dependent variable array
%         x must have constant spacing
% Outputs:
%     I - The estimated integral of the function
% CAUTION: Code might not work for #'s more precise 
%   than 7 decimal places, (error msg for spacing appears)
%    Yes I know it was lazy.

% Input checks...nargin/dimensions/spacing

[~,n]=size(x); [~,p]=size(y);
q=n; % This is to preserve n if trap rule not needed
if nargin~=2
    error('Enter two inputs')
end
if n~=p
    error('Inputs need to have equal dimensions & be row vectors')
end
if round(linspace(x(1),x(n),n),7)~=round(x,7)
    error('x vector needs equal spacing')
end

% MEATPOTATO

% The if-statement has the last trap rule embedded
% and checks if even/odd # of sections for 1/3 rule

Itrap=0;    % 0 if I don't need it  
if round(n/2)==n/2  % False if n=(odd #)
    q=n-1;          % Alter q for simpson formula
    Itrap=((y(n)+y(n-1))/2)*(x(n)-x(n-1)); % Area formula
    disp('Trapezoid rule used on last interval')
end

% Simpson 1/3 rule, no trapezoid
Hover3=((x(q)-x(1))/(3*(q-1))); % q-1 in the denominator!
I4=0;
for i=2:2:(q-1)    % Summation of middle points
    I4=y(i)+I4;  % Factor of 4 not applied yet
end
I2=0;
for w=3:2:(q-2)    % Summation of side points
    I2=y(w)+I2;  % Factor of 2 not applied yet
end

% Now I can put my summations all together into
%   the Simpson's rule formula below
Isimp=Hover3*(y(1)+(4*I4)+(2*I2)+y(q)); 
I=Isimp+Itrap;  % Don't forget to add the possible trapezoid
end


