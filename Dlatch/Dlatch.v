`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2023 13:35:58
// Design Name: 
// Module Name: Dlatch
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

module Dlatch(
    input en,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
    );
    reg [15:0] qreg;
    
    
    always@(*) begin
    
    qreg = d;
    
    if (en) begin 
    
    if (!byteena[0]) begin
    qreg[7:0] =8'b0;
    end
    if (!byteena[1]) begin
    qreg[15:8] = 8'b0;
    end
    
    end
    
    end //always block end
    
    assign q = qreg;
    
    
    
    
    
endmodule
