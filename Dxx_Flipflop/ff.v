`timescale 1ns/1ps

module flip_flop (
input wire clk,
input wire D,

output wire  Q

);
reg qreg;
always@ (posedge clk) begin

qreg <= D;


end

assign Q=qreg;
endmodule
