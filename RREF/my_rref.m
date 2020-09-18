function [B] = my_rref(A)

[r,c] = size(A);

for row = 1:r
    row2 = row;
    col = row;
    if A(row, row) == 0 || abs(A(row, row)) > 0 && abs(A(row, row)) < 1e-12
        %%%Checks to see if piv equal to 0
        A(row, row) = 0;
        while row2 ~= r+1 && A(row2, col) == 0 %Finds a number >0 to be a pivot
            if row2 == r && col ~= c %If we can't find any numbers below row > 0 we a column right
               col = col+1; %%Moves column to the right
               row2 = row; %%Sets row2 back to the original pivot row
               break
            elseif row2 == r && col == c
                col = row;
                row2 = row;
                break
            end
                row2 = row2+1; %Moves on to next row to be a pivot
            end
    end      %If pivot point is 0, move onto the next column

        if A(row2, col) ~= 0 %Position after while loop isn't 0, swap the two rows
        A = interchange(A, row, row2) %Will swap with itself if already a row that doesnt have 0
        end
        
        if sum(abs(A(row,:))) ~= 0 %%Makes sure whole row isn't 0
        A(row,:) = A(row,:)/A(row,col); %%Divides whole row by pivot point to get pivot as 1
        end
            for piv=1:r
                if piv ~= row && sum(abs(A(row,:))) ~= 0 %Subtract row by the scaled pivot row
                    A(piv,:) = A(piv,:) - A(row,:)*A(piv,col);
                    %replacement(A, piv, row, A(piv,col));
                    %%disp('executed')
                end
            end
            
end
for row=1:r %%Checks to see if there are any negative zeros or formatting errors
    for col=1:c %Lines of code below sets values that are -0 value that shows 0.0000 to be 0
                if abs(A(row, col)) > 0 && abs(A(row, col)) < 1e-12
                    A(row,col) = 0;
                end
    end
end
B = A;
end


