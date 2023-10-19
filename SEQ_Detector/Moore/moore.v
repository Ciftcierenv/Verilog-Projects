`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2023 22:56:12
// Design Name: 
// Module Name: moore
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


module moore(
    input wire reset,clk,d_in,
    output reg d_out,
     reg [3:0] state,next
    );
    

    parameter S0= 4'h1;
    parameter S1= 4'h2;
    parameter S2= 4'h3;
    parameter S3= 4'h4;
    parameter S4= 4'h5;
    
    always@ (posedge clk or posedge reset) begin
    
        if(reset) begin 
        state <= S0;
        d_out <=1'b0;
        
        end
        else begin state<=next; end
    end
    
    always@ (state or d_in) begin
    
    case (state) 
    
    S0: begin
    if (d_in) begin next<=S1; end
    else begin next<=S0; end
    
    end
    S1: begin 
    if (d_in) begin next<=S1; end
    else begin next<=S2; end
    end
    
    
    S2: begin 
    if (d_in) begin next<=S3; end
    else begin next<=S0; end
    end
    
    
    S3: begin 
    if (d_in) begin next<=S4; d_out<=1; end
    else begin next<=S0; end
    end
    
    S4: begin 
    if (d_in) begin next<=S1; end
    else begin next<=S2; end
    end
    
    
    
    endcase
    
end
    
        
endmodule
