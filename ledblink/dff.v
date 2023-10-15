`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2023 15:59:02
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
    input reset,D,clk,
    output reg Q
    );
    
    always@ (posedge clk or posedge reset) begin
    
    if (reset) begin
    Q <= 1'b0;
    end
    else begin
    Q <= D;
    end
    
    end
    
endmodule
