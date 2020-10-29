function [a,y] = stamp(ain,yin,n1,n2,val,type,name,numNodes)
   
    a = ain;
    y = yin;
    
    if type == 1
        str = erase(name,"V");
        vnum = str2num(str);
        [a,y] = stamp_in_voltage_source(a,y,n1,n2,numNodes+vnum,val);
    end
    if type == 2
        [a,y] = stamp_in_current_source(a,y,n1,n2,val);
    end
    if type == 3
        a = stamp_in_resistor(a,y,n1,n2,val);
    end
    
end

