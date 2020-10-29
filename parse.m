% We want to be able to insert voltage sources, current sources, resistors. For now just assume dc analysis. We need to
% be able to count the number of resistors, voltage sources, current sources. 
% We also want the component order to not matter in the netlist.

clear all
% open the netlist
fid = fopen('circuit1.txt'); 
C = textscan(fid, '%s %f %f %s'); 

nnums = [C{2};C{3}]; % grab the node numbers
numNodes = max(nnums); % find number of nodes

% we need a matrix with size (n+m) by (n+m) where n is the number of nodes and
% m is the number of voltage sources.

numElements = length(C{2}); % grab total number of elements in circuit
elements = zeros(3,1); % vector to count each element present in circuit
type = zeros(numElements,1); % vector to flag each element type

% flag the voltage sources, current sources,
% and resistors in the circuit.
for i = 1:numElements
    [type(i),elements] = detect_element(elements,C{1}{i});
end

% now, the elements vector tells us how many of each component exists in the
% circuit, and the type vector tells us where each of them are in the
% netlist

% create the A and y matrices now that we know how many resistors and voltage
% sources we have
size = numNodes + elements(1); % number of nodes + number of voltage sources
a = zeros(size);
y = zeros(size,1);

% fill out the a and y matrices
for i = 1:numElements
    [a,y] = stamp(a,y,C{2}(i),C{3}(i),str2num(C{4}{i}),type(i),C{1}{i},numNodes);
end

inv(a)*y

fclose(fid);