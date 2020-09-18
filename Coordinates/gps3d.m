%% 
% Solve for the 3D coordinate of P as a problem of linear system
%
% The parameters received are:
% - a (3 x 1): 3D coordinate of point A
% - b (3 x 1): 3D coordinate of point B
% - c (3 x 1): 3D coordinate of point C
% - d (3 x 1): 3D coordinate of point D
% - ra (1 x 1): distance from A to P
% - rb (1 x 1): distance from B to P
% - rc (1 x 1): distance from C to P
% - rd (1 x 1): distance from D to P
% 
% The function should return
% - p (3 x 1): 3D coordinate of P

function p = gps3d(a, b, c, d, ra, rb, rc, rd)
A = zeros(3,3); %%Create a 2x2 matrix of zeros. Left hand side
V= zeros(2,1); %Create a 2x1 matrix containing zeros. This will be the righthand side


A(1,1) = 2*(a(1,1)-b(1,1)); %These lines of code for A calculate each position in the lefthand matrix
A(1,2) = 2*(a(2,1)-b(2,1));
A(1,3) = 2*(a(3,1)-b(3,1));

A(2,1) = 2*(b(1,1)-c(1,1));
A(2,2) = 2*(b(2,1)-c(2,1));
A(2,3) = 2*(b(3,1)-c(3,1));

A(3,1) = 2*(c(1,1)-d(1,1));
A(3,2) = 2*(c(2,1)-d(2,1));
A(3,3) = 2*(c(3,1)-d(3,1));

V(1) = (a(1,1))^2 + (a(2,1))^2 + (a(3,1))^2 - (b(1,1))^2 - (b(2,1))^2 - (b(3,1))^2 + ((rb)^2 - (ra)^2); %Calculates each position in the right hand side of the equation
V(2) = (b(1,1))^2 + (b(2,1))^2 + (b(3,1))^2 - (c(1,1))^2 - (c(2,1))^2 - (c(3,1))^2 + ((rc)^2 - (rb)^2);
V(3) = (c(1,1))^2 + (c(2,1))^2 + (c(3,1))^2 - (d(1,1))^2 - (d(2,1))^2 - (d(3,1))^2 + ((rd)^2 - (rc)^2);

p = solve(A, V); %Calculates p




end