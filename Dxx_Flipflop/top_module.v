`timescale 1ns/1ps

module top_module(
input wire sel, a,b,clk,
output wire D,
output wire Q
);
generate

flip_flop ff(
.clk(clk),
.D(D),
.Q(Q)

);

mux mux(
.a(a),
.b(b),
.sel(sel),
.x(D)

);
endgenerate
endmodule
