`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2023 13:54:03
// Design Name: 
// Module Name: Dflipflop
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


module Dflipflop(
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
    );
    reg [15:0] qreg;
    
    
    always@(posedge clk) begin
    qreg <= d;
    if (resetn) begin
        qreg <= 16'b0000000000000000;
    end
    
    else begin 
    
    if (!byteena[0]) begin
    qreg[7:0]<=8'b00000000;
    end
    if (!byteena[1]) begin
    qreg[15:8] <= 8'b00000000;
    end
    
    end
    
    end //always block end
    
    assign q = qreg;
    
    
    
    
    
endmodule
