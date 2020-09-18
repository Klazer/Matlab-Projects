function [B] = replacement(A, i, j, s)
A(i,:) = A(i,:) + (A(j,:)*s); %Adds j multiplied by a scalar to row i.

B = A;

end