`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2023 22:57:10
// Design Name: 
// Module Name: mealytb
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


module mealytb(
    output d_out
    );
    
    reg d_in;
    wire [3:0] states;
    reg clk,reset;
 

    
    mealy uut(
    .d_in(d_in),
    .d_out(d_out),
    .states(states),
    .clk(clk),
    .reset(reset)
    );
    
    always begin
    
    #5 clk=~clk;
    
    end
    integer x;
    initial begin
    
    reset=0;
    clk=0;
    d_in=4'b0;
    #10
    
    reset=1;
    
    #5
    
    reset=0;
    #5
    
    d_in=1; #10
    d_in=0; #10
    d_in=1; #10
    d_in=1; #10
  
    
    $finish;
    end
    
