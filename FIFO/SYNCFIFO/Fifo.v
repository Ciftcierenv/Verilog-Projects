`timescale 1ns/1ps


module fifo (
input wire clk,wr_en,rd_enb,reset,
input wire [WIDTH-1:0] din,
output reg [WIDTH-1:0] dout,
output reg fullreg,emptyreg
);
integer i;
parameter DEPTH = 16;
parameter WIDTH = 16;
parameter LOG = 5;

reg [WIDTH-1:0] memory [0:DEPTH-1];
reg [LOG-1:0] readaddr;
reg [LOG-1:0] writeaddr;

initial begin


for (i=0; i<DEPTH; i=i+1) begin
memory[i] = 16'b0;

end
dout=16'b0;
emptyreg <=1;
fullreg <=0;
writeaddr=0;
readaddr=0;
end

always@(posedge clk) begin
if (reset) begin 
  writeaddr <=0; 
  readaddr <=0; 
  end
end
always@(posedge clk) begin
if (wr_en) begin
    if (writeaddr+1 == readaddr) begin fullreg<=1'b1;  end 
    else begin fullreg<=1'b0; end
    if (!fullreg) begin 
        memory[writeaddr] <=din;
        writeaddr <= writeaddr + 1;
    end
end
end
   
always@(posedge clk) begin  
 if (rd_enb) begin
 
    if (readaddr == writeaddr) begin emptyreg<=1'b1; end 
    else begin emptyreg<=1'b0;  end
    if (!emptyreg) begin 
        dout <= memory[readaddr];
        readaddr <= readaddr + 1;
    end
end
end

endmodule
