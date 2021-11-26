`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2021 13:37:54
// Design Name: 
// Module Name: dff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dff(
    input d_input,
    input d_clk,
    input d_rst,
    output reg d_out
    );

// at the rising clock edge sample the output of the XOR tree
always @(posedge d_clk)
begin
    if(d_rst == 1'b1) begin
        d_out <= 1'b0;
    end
    else begin
    d_out <= d_input;
    end
end    

endmodule
