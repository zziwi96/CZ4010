`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.11.2021 13:25:56
// Design Name: 
// Module Name: bit_accumulator
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


module bit_accumulator
#(
    parameter OUTPUT_SIZE = 8
)
(
    input acc_input_bit, // 1 bit input
    input acc_clk,
    output reg [(OUTPUT_SIZE-1):0] acc_out // 8 bit output
);

reg [5:0] counter;
reg [(OUTPUT_SIZE-1):0] accumulator;

initial begin
    counter = 0;
    accumulator = 0;
    acc_out = 0;
end

always @(posedge acc_clk)
begin

    if(counter == (OUTPUT_SIZE)) begin
        acc_out = accumulator;
        counter = 0;
        accumulator[counter] = acc_input_bit;
    end
    else begin
        accumulator[counter] = acc_input_bit;
    end
    
    counter = counter + 1; // must be sequential assignment

end    
    
endmodule
