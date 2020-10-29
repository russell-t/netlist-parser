function [type, eleout] = detect_element(elein,name)
%DETECT_ELEMENT Summary of this function goes here
%   Detailed explanation goes here
    eleout = elein;
    if strncmpi(name,'V',1)
        type = 1;
        eleout(1) = eleout(1) + 1;
    end
    if strncmpi(name,'I',1)
        type = 2;
        eleout(2) = eleout(2) + 1;
    end
    if strncmpi(name,'R',1)
        type = 3;
        eleout(3) = eleout(3) + 1;
    end
end

