`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2023 11:50:42
// Design Name: 
// Module Name: serialaddertb
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


module serialaddertb(
    );
    
    reg [7:0] A,B;
    reg clk,resetn,start;
    wire [8:0] sum;
    
    
    serialadder uut(
    .A(A),
    .B(B),
    .clk(clk),
    .resetn(resetn),
    .start(start),
    .sum(sum)
    
    );
    
    always begin
    #5 clk=~clk;
    end
    assign sum = 9'b0;
    initial begin
    
    clk =0;
    resetn=0;
    start =0;
    A=8'b0;
    B=8'b0;
    
    #20
    
    resetn=1;
    start=1;
    #50;
    
    resetn=0;
    A=8'b00100101;
    B=8'b00010010;
    
    #50;
    
    A=8'b011001011;
    B=8'b010010010;
    
    #50;
    
    A=8'b11101001;
    B=8'b10100001;
    
    #50;
    
    $finish;
    end
    
endmodule
