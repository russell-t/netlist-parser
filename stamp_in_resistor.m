function a = stamp_in_resistor(ain,row,col,rvalue)
%STAMP_IN_RESISTOR Stamps in a resistor.
%   Credit to Bruce Segee for this code.
    a=ain;
    if row ~=0
        a(row,row)=a(row,row)+1/rvalue;
    end
    if col ~=0
        a(col,col) = a(col,col)+1/rvalue;
    end
    if row*col ~=0
        a(row,col) = a(row,col)-1/rvalue;
        a(col,row) = a(col,row)-1/rvalue;
    end
end

