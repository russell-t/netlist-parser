function [a,y] = parse(FILENAME)
%PARSE Parses a netlist into A and y matrices.
%
%   [a,y] = parse(FILENAME)  
%
% The purpose of this script is to read in a netlist from a .txt file and
% generate an A matrix from it.
% 
% Assume one source voltage for now
% and its positive terminal connected to first node
% in the netlist, i.e. VS 4 1 5 means positive terminal
% is connected to node 4.
%
% note: right now resistor values have to be in
% 'long form' i.e. no 1K, 1M, etc. 

    % read in the netlist
    fileID = fopen(FILENAME);
    C = textscan(fileID, '%s %f %f %f');

    nnums = [C{2};C{3}]; % grab the node numbers
    numNodes = max(nnums); % find number of nodes
    numElements = length(C{2})-1; % find number of resistors
    a = zeros(numNodes+1); % initialize the A matrix
    y = zeros(numNodes+1,1);

    % stamp in the resistors
    for i = 1:numElements
        a = stamp_in_resistor(a,C{2}(i+1),C{3}(i+1),C{4}(i+1));
    end

    % stamp in the voltage source
    a = stamp_in_voltage_source(a,C{2}(1),C{3}(1));
    
    % insert Vs into y matrix
    y(length(y)) = C{4}(1);

    fclose(fileID);
end

