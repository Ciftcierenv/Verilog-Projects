`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2023 13:54:12
// Design Name: 
// Module Name: fifotb
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


module fifotb(
    output[15:0] dout,
    output fullreg,emptyreg
    );
    reg clk,reset,wr_en,rd_enb;
    reg [15:0] din;
    
    fifo uut(
    .clk(clk),
    .reset(reset),
    .wr_en(wr_en),
    .rd_enb(rd_enb),
    .din(din),
    .dout(dout),
    .fullreg(fullreg),
    .emptyreg(emptyreg)
    );
    always begin
    #5
    clk = ~clk;
   
    end
    
    initial begin
    clk=0;
    reset=0;
    din =16'b0;
    wr_en = 0;
    rd_enb=0;
    
    
   #50 
    reset=1;
    
    #20
    reset = 0;
    din=16'b1011100101001110;
    wr_en=1;
     
     
    #20
    
    wr_en=0;
    rd_enb=1;
    
    #50
    
    $finish;
    end
    
endmodule
