`timescale 1ns/1ps


module dualport # (
parameter RAM_WIDTH =16,
parameter RAM_DEPTH = 1024,
parameter LOG = 10

)(
input clk,wrena,wrenb,rdena,rdenb,
input [LOG-1:0] addra,addrb,
input [RAM_WIDTH-1:0] dina,dinb,

output reg [RAM_WIDTH-1:0] douta,doutb

);

(* ram_style = "block"*) 
reg [RAM_WIDTH-1:0] ram [0:RAM_DEPTH-1]; 

integer i;

initial begin 

for(i=0; i<RAM_DEPTH; i=i+1) begin
ram[i] = 0;
end

end


always@ (posedge clk) begin 
if (addra==addrb) begin 
    if (!wrena && !wrenb) begin
        if(rdena == wrenb == 1) begin //WRITE_FIRST
           ram[addra] <= dinb;
           douta <= ram[addra];
        end
        else if (rdena) begin douta <= ram[addra]; end      
        else if (wrenb) begin ram[addra] <= dinb; end
        if(rdenb == wrena == 1) begin //READ_FIRST
            
            doutb <= ram[addra];
            ram[addra] <= dina;
        end
        else if (rdenb) begin doutb <= ram[addra]; end      
        else if (wrena) begin ram[addra] <= dina; end
        
    end
end
else begin
    if (wrena) begin
    ram[addra] <= dina;  end
    if (rdena) begin douta <= ram[addra]; end end
    if (wrenb) begin
    ram[addrb] <= dinb;  end
    if (rdenb) begin doutb <= ram[addrb]; end
end




endmodule
