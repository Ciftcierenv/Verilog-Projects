`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2023 15:09:09
// Design Name: 
// Module Name: 3bitupdown
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


module threebitupdown(
        input clk,reset,
        input count_dir,
        output reg [2:0] count
    );
    
    always@(posedge clk) begin
    
    
    if (reset) begin
    count <= 3'b0;
    end
    else begin
    if (count_dir && count!=3'b111) begin
    count <= count+1;
    end
    
    else if (count_dir == 1'b0 && count!=3'b000) begin 
    count <= count-1;
    end
    
    
    end //line 36 block end
    
    
    end //always end
    
    
    
endmodule
