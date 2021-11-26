`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2021 13:42:23
// Design Name: 
// Module Name: top
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


module top
#(
    parameter OUTPUT_SIZE = 8
)
(
    input top_clk,
    input top_rst,
    input btn_tx,
    output top_led_out,
    output TxD,
    output TxD_debug,
    output transmit_debug,
    output clk_debug
);

assign TxD_debug = TxD;
assign transmit_debug = deb2tx;

assign clk_debug = top_clk;

wire xor2dff;
wire d2acc;
wire [(OUTPUT_SIZE-1):0] acc2tx;
wire deb2tx;

(* KEEP="TRUE" *) xor_tree tree (.xor_clk(top_clk), .xor_rst(top_rst), .xor_out(xor2dff));
(* KEEP="TRUE" *) dff dff_1 (.d_clk(top_clk), .d_input(xor2dff), .d_rst(top_rst), .d_out(d2acc));
(* KEEP="TRUE" *) led_flasher lf_1 (.led_clk(top_clk), .led_en(d2acc), .led_out(top_led_out));
(* KEEP="TRUE" *) bit_accumulator #(.OUTPUT_SIZE(OUTPUT_SIZE)) acc_1(.acc_input_bit(d2acc), .acc_clk(top_clk), .acc_out(acc2tx));
(* KEEP="TRUE" *) uart_debouncer deb_1(.clk(top_clk), .btn1(btn_tx), .transmit(deb2tx));
(* KEEP="TRUE" *) uart_transmitter tx_1(.clk(top_clk), .reset(top_rst), .transmit(deb2tx), .data(acc2tx), .TxD(TxD));    

endmodule
