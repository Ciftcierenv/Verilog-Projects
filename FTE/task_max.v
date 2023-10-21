`timescale 1ns/1ps
module taskmax(
input[7:0]a,
input[7:0]b,
output [7:0]out
);
reg [7:0] outreg;
task compare(input[7:0]a,input[7:0]b,output reg[7:0]outreg);
if (a>b) begin
    outreg <= a;
end
else begin outreg <= b; end

endtask

always@* begin

compare(a,b,outreg);
end
assign out=outreg;
endmodule
