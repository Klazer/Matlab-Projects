%% 
% Performs matrix decomposition for A = LU
%
% The parameters received are:
% - A (n x n): a rectangular matrix
% 
% The function should return
% - L (n x n) 
% - U (n x n)

function [L, U] = my_lu(A)

[r,c] = size(A);

L = eye(c);
U = A;

for i = 1:c-1
    if abs(U(i, i)) < 1e-12
        break
    end
    for k =i+1:c
        p = U(k,i)/U(i,i);
        [U, L] = replacement_lu(U, k, i, p, L);
    end
end
end