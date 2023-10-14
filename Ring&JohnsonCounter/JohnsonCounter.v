`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2023 13:30:09
// Design Name: 
// Module Name: Johnson
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


module Johnson (
  input wire clk,
  input wire clear,
  output wire [3:0] q
);

  reg [3:0] qreg;

  always @(negedge clk or negedge clear) begin
    if (!clear) begin
      qreg <= 4'b0000;
    end else begin
      qreg[3] <= qreg[2];
      qreg[2] <= qreg[1];
      qreg[1] <= qreg[0];
      qreg[0] <= !qreg[3];
    end
  end

  assign q = qreg;

endmodule
