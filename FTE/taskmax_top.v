`timescale 1ns/1ps

module taskmaxtop (
);
reg[7:0] a,b;
reg [7:0]out;

taskmax comp(
.a(a),
.b(b),
.out(outreg)
);

initial begin
out = 8'b0;
a= 8'b01010101;
b= 8'b01100000;


$display("%d",out);
#20

a= 8'b10010010;
b= 8'b10001000;

$display("%d",out);
$finish;
end

endmodule
