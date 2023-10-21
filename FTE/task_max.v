`timescale 1ns/1ps
module taskmax(
input[7:0]a,
input[7:0]b,
output reg [7:0]out
);

task compare(input[7:0]a,input[7:0]b,output reg[7:0]out);
if (a>b) begin
    out <= a;
end
else begin out <= b; end

endtask

always@* begin

compare(a,b,out);
end

endmodule
