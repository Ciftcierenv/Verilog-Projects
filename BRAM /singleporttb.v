`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2023 11:21:24
// Design Name: 
// Module Name: simpledualporttb
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


module singleporttb  (
   
    );
    
    reg clk,write,read;
    reg [9:0] add;
    reg [15:0] din;
    wire [15:0] dout;
    
    singleport uut(
    
    .clk(clk),
    .add(add),
    .write(write),
    .read(read),
    .din(din),
    .dout(dout)
    
    );
    
    always begin  #5 clk <= ~clk; end
    
    
    initial begin 
    
    clk=0;
    write = 1;
    read =0;
    din =8'hAB;
    add = 0;
    
    
    
    add = 1;
    
    #50
    
    write = 0;
    
    #50
    
    add = 0;
    read = 1;
    #50
    
    add = 1;
    read = 0;
    
    #50
    $finish;
    end
    
endmodule
