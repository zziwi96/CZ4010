# CZ4010/hdl_src

This folder contains all the design source file for the project. No simulation source (test bench) was included as ring oscillators produce undefined output in Vivado's hardware simulator. 

Top.v acts as the top level controller. Both xor_tree.v and param_ring_oscillators are parameterised. Please change the N_INV and N_INPUT when instantiating the xor_tree module to change the number of inverter stage in the ring oscillators, and how many ROs to use in parallel.
