`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2023 22:52:54
// Design Name: 
// Module Name: ledblinktb
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


module ledblinktb(
    
    output wire [26:0] clkout,
    output wire [26:0] din,
    
    output reg [26:0] Q,
    output reg led
    );
    reg [1:0] switch;
    reg reset;
    reg clk;
    
    ledblink uut(
    .clk(clk),
    .clkout(clkout),
    .din(din),
    .Q(Q),
    .led(led),
    .switch(switch),
    .reset(reset)
    
    );
    
    always begin
    #2
    clk <= ~clk;
    end
    
    initial begin
    
    reset = 0;
    clk=0;
    switch = 2'b00;
    
    #1000
    
    reset = 1;
    
    #300
    
    reset = 0;
    switch = 2'b01;
    
    #1000
    
    switch = 2'b10;
    
    
    #1000
    
    switch = 2'b11;
    
    #1000
    
    $finish;
    end
    
    
    
    
endmodule
