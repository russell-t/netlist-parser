function a = stamp_in_voltage_source(ain,n1,n2)
%STAMP_IN_VOLTAGE_SOURCE Stamps in a voltage source
%   
    a=ain;
    
    % this assumes 1 voltage source Vs
    % where Is values are in the last column of the
    % a matrix
    if n1 ~=0
        a(n1,length(a)) = 1;
    end
    if n2 ~=0
        a(n2,length(a)) = -1;
    end
    
    % extra equation for Is
    if n1 ~=0
        a(length(a),n1) = 1;
    end
    if n2 ~=0
        a(length(a),n2) = -1;
    end
    
end

