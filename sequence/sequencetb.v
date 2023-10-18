`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2023 16:41:37
// Design Name: 
// Module Name: sequencetb
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


module sequencetb(

    );
    reg clk,reset;
    wire [63:0] num4;
    
sequence uut(
.clk(clk),
.reset(reset),
.num4(num4)

);

always begin
    #1 clk=~clk;
    
end

initial begin

reset=0;
clk=0;

#100

reset=1;

#100;

reset=0;

#500



$finish;
end
endmodule
