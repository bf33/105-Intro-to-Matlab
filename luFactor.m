function [L,U,P] = luFactor(A)
% by: Blake Franklin (referencing the textbook)
% Function that uses partial pivoting and Guassian
% elimination to LU factorize the square matrix A.
%
% Inputs:  A = Coefficient matrix
%
% Outputs: L = Lower triangular matrix
%          U = Upper triangular matrix
%          P = Pivot matrix


% Checking inputs are correct
[m,n] =size(A);
if m~=n
    error('Matrix has to be square')
elseif m<2
    error('You need matlab for this?')
end
P= eye(m,n); %Start out with Identity Matrix for pivot tracking

% Partial Pivoting
for k=1:n-1   % Don't have to pivot the last column therefore 1:n-1
    pivotvalue=max(abs(A(k:n,k))); % max value in column/partial column
    for i=k:n
        if abs(A(i,k))==pivotvalue  % Finds the row that shoud be up top
            rowi=A(i,:);
            rowk=A(k,:);
            A(i,:)=rowk;   % All this switches the rows in both the 
            A(k,:)=rowi;   % A and P matrices, I have to record the 
            Prowi=P(i,:);  % rows as other variables (rowi/rowk...)
            Prowk=P(k,:);  
            P(i,:)=Prowk;
            P(k,:)=Prowi;
        end
    end
end

% Guass Elimination for [U] and [L]
for r=1:n-1   % Selects values along the diagonal
    for u=r+1:n % In order to select rows below diagonal
        mult= A(u,r)/A(r,r); % Divide the value above with one below
        rowu=A(u,:);   % Designate row to save it from being overwritten
        A(u,:)=rowu-(mult.*(A(r,:))); % Value is now 0 after elimination
        Lproto(u,r)=mult;     % Adds to lower Diag matrix each iteration
    end  
end
U=A;
L=eye(m,n);  %Creates the diagonal ones that the L is missing
for t=1:n-1  %Only way I found to make L have ones as well as values (edit-I should concatenate here)
    L((t+1:n),t)=Lproto((t+1:n),t);
end
end
        
        
