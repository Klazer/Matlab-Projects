function [B] = interchange(A, i, j)
temp = A(i,:); %Assigns original row as a temporary variable
A(i,:) = A(j,:); %Original row becomes j
A(j,:) = temp; %Row at position j then becomes the orignal row. They are now switched
 
B = A;
end