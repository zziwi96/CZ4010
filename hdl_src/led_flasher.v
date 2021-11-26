`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2021 14:17:27
// Design Name: 
// Module Name: led_flasher
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


module led_flasher(
    input led_en,
    input led_clk,
    output reg led_out
    );
    
parameter MAX_COUNT = 100_000_00 - 1;
reg [26:0] counter_100M;
reg [3:0] counter_10;


initial
begin
    counter_100M <= 0;
    counter_10 <= 0;
    led_out <= 0;
end

always @(posedge led_clk)
begin
    if((counter_100M == MAX_COUNT))
    begin
        counter_100M <= 0;
    end
    else
    begin
    counter_100M <= counter_100M + 1'b1;
    end   
end

always @(posedge led_clk)
begin
    if(counter_100M == 0)
    begin
    led_out = led_en;
    end
end

endmodule
