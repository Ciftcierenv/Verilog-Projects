`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2023 14:59:03
// Design Name: 
// Module Name: top_moduletb
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


module top_moduletb(
    output D,
    output Q
    );
    reg clk,a,b,sel;
    
    top_module uut (
    .clk(clk),
    .a(a),
    .b(b),
    .sel(sel),
    .D(D),
    .Q(Q)
    );
    
    always begin
    #2 clk<=~clk;
    end
    
    
    initial begin
    clk=0;
    a=0;
    b=0;
    sel=0;
    
    #100
    
    a=0;
    b=0;
    sel=1;
    
    #100
    
    a=1;
    b=0;
    sel=0;
    
    #100
    
    a=1;
    b=0;
    sel=1;
    
    #100
    
    a=0;
    b=1;
    sel=0;
    
    #100
    
    a=0;
    b=1;
    sel=1;
    
    #100
    
    a=1;
    b=1;
    sel=0;
    
    #100
    
    a=1;
    b=1;
    sel=1;
    
    #100
    
    
    $finish;
    end
    
endmodule
