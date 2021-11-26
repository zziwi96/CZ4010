`timescale 1ns/1ps

module xor_tree #(
    parameter N_INPUT = 50,
    parameter N_INV = 3
)
(
    input wire xor_clk,
    input wire xor_rst,
    output wire xor_out
);

(* KEEP="TRUE" *) wire [N_INPUT-1:0] xor_signal;
(* KEEP="TRUE" *) wire xor_intermediate_signal;

genvar j;
genvar k;
generate
    // dynamically create and instantiate the ring oscillators
    for(j=0; j<N_INPUT; j=j+1)
    begin : ro_collection
        (* KEEP="TRUE" *) param_ring_oscillator #(.NUMINV(N_INV)) ro_j (.ro_clk(xor_clk), .ro_rst(xor_rst), .ro_out(xor_signal[j]));
    end
    // connect the output of the ring oscillators to an XOR tree
    assign xor_intermediate_signal = ^xor_signal;
endgenerate

assign xor_out = xor_intermediate_signal;

endmodule