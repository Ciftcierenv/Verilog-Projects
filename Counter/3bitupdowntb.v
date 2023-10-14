`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2023 18:04:01
// Design Name: 
// Module Name: threebittb
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


module threebittb(
    output reg [2:0] count
    );
    reg clk,reset,counterdir;
    
    threebitupdown uut (
    .count(count),
    .clk(clk),
    .reset(reset),
    .counterdir(counterdir)
    
    );
    
    always begin
    #5 clk = ~clk; 
    end
    
    initial begin
    
    clk=0;
    reset=0;
    counterdir=1;
    
    #300;
    
    reset=1;
    
    #50;
    
    reset=0;
    count= 3'b111;
    counterdir=0;
    
    #300
    
    $finish;
    end
    
    
endmodule
