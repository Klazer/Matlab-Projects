function [B] = scaling(A, i, s)
A = A(i,:) * s; %Multiplies row i by a scalar, s

B = A;
end