`timescale 1ns/1ps

module taskmaxtop (

output wire[7:0] out
);
reg[7:0] a,b;

taskmax comp(
.a(a),
.b(b),
.out(out)
);

initial begin

a= 8'b01010101;
b= 8'b01100000;

#20

a= 8'b10010010;
b= 8'b10001000;

#20
$finish;
end

endmodule
