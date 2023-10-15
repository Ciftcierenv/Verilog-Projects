`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2023 22:52:54
// Design Name: 
// Module Name: ledblink
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


module ledblink(
    input [1:0] switch,
    input reset,
    input clk,
    output wire [26:0] clkout,
    output wire [26:0] din,
    
    output reg [26:0] Q,
    output reg led
    );
    
    dff first(
    .clk(clk),
    .reset(reset),
    .D(din[0]),
    .Q(Q[0])
    );
    
    genvar x;
    
    generate
    
    for (x=1; x<27; x=x+1) begin
    dff half(
    .reset(reset),
    .clk(clkout[x]),
    .D(din[x]),
    .Q(Q[x])
    );
    
 
    
    
    end // for loop end
    
    endgenerate
    
    assign din = !clkout;
    
    always@ (posedge clk) begin 
    
    if (switch == 2'b00) begin
        led <= clkout[26];
    end
     if (switch == 2'b01) begin
        led <= clkout[25];
    end
     if (switch == 2'b10) begin
        led <= clkout[24];
    end
     if (switch == 2'b11) begin
        led <= clkout[23];
    end
    
    
    end
    
    
endmodule
