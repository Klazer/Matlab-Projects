%% 
% Solve for the 2D coordinate of P as a problem of linear system
%
% The parameters received are:
% - a (2 x 1): 2D coordinate of point A
% - b (2 x 1): 2D coordinate of point B
% - c (2 x 1): 2D coordinate of point C
% - ra (1 x 1): distance from A to P
% - rb (1 x 1): distance from B to P
% - rc (1 x 1): distance from C to P
% 
% The function should return
% - p (2 x 1): 2D coordinate of P

function p = gps2d(a, b, c, ra, rb, rc)

A = zeros(2,2); %%Create a 2x2 matrix of zeros. Left hand side
V= zeros(2,1); %Create a 2x1 matrix containing zeros. This will be the righthand side


A(1,1) = 2*(a(1,1)-b(1,1)); %These lines of code for A calculate each position in the lefthand matrix
A(1,2) = 2*(a(2,1)-b(2,1));

A(2,1) = 2*(b(1,1)-c(1,1));
A(2,2) = 2*(b(2,1)-c(2,1));

V(1) = (a(1,1))^2 + (a(2,1))^2 - (b(1,1))^2 - (b(2,1))^2 + ((rb)^2 - (ra)^2); %Calculates each position in the right hand side of the equation
V(2) = (b(1,1))^2 + (b(2,1))^2 - (c(1,1))^2 - (c(2,1))^2 + ((rc)^2 - (rb)^2);

p = solve(A, V); %Calculates p


end