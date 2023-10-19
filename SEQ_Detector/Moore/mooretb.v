`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2023 23:27:08
// Design Name: 
// Module Name: mooretb
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


module mooretb(
    
    );
    
    reg d_in,clk,reset;
    wire [4:0] state;
    wire d_out;
    
    moore uut(
    .d_in(d_in),
    .clk(clk),
    .reset(reset),
    .state(state),
    .d_out(d_out)
    );
    
    always begin
    #2 clk=~clk;
    end
    
    initial begin
    clk=0;
    d_in =0;
    reset=0;
    #5 
    reset=1;
    
    #5
    
    reset=0;
    
    
    #5 d_in = 1;
    #5 d_in = 0;
    #5 d_in = 1;
    #5 d_in = 1;
    
    
    $finish;
    end
    
endmodule
