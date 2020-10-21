# netlist-parser

This code parses a "netlist" of the format specified in netlist.txt. From the netlist, A and y matrices are created to be used in DC analysis. At the moment, a netlist of only **one** voltage source that **must** be at the top of the netlist, followed by **only** resistors, is supported. In the future, support for multiple voltage sources, capacitors and inductors, as well as AC analysis and transient analysis will be added.  
  
# How to use

Simply run dc.m. Change the circuit configuration in the netlist.txt file, but beware there is currently **NO** error checking of the netlist, so make sure the format, nodes, and values are correct.

The output variable 'dc_values' contains the node voltages of the circuit starting from node 1, followed by the source current 'Is' as the last entry.