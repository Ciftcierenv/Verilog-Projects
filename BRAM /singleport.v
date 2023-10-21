`timescale 1ns/1ps


module singleport # 
(
parameter RAM_WIDTH = 16,
parameter RAM_DEPTH=1024
) 
(
input clk,
input[RAM_WIDTH-1:0] din,
input wire write,read,
input [9:0] add,
output reg [RAM_WIDTH-1:0] dout
);
(* ram_style= "block" *) reg [RAM_WIDTH-1:0] ram [0:RAM_DEPTH-1]; 
 
integer i;

initial begin 

for(i=0; i<RAM_DEPTH; i=i+1) begin
ram[i] = 0;
end

end

 always@ (posedge clk) begin
 
 if(write) begin 
 ram[add] <= din;
 
 end
 else if (read) begin
 dout <= ram[add];
 
 end
 end

endmodule
