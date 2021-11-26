`timescale 1ns/1ps

module param_ring_oscillator #(
    // NUMINV specifies the number of inverters (i.e stages of the RO) used in the module
    parameter NUMINV = 3,
    parameter DELAY = 0.01
)
(
    input wire ro_clk,
    input wire ro_rst,
    output reg ro_out
);

(* KEEP="TRUE" *) wire [NUMINV-1:0] ro_signal;
genvar i;

generate
    for(i=0; i<NUMINV; i=i+1) 
    begin
        (* KEEP="TRUE" *) not #(DELAY) (ro_signal[(i+1) % NUMINV], ro_signal[i]);
    end    
endgenerate

// sample the ring oscillator when the clock/enable signal is detected
always @(posedge ro_clk)
begin 
    
    if(ro_rst == 1'b1) begin
        ro_out <= 1'b0;
    end
	else begin
		ro_out <= ro_signal[0];
	end
    
end
endmodule