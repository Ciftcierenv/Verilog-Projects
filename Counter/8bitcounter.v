`timescale 10ms / 1ps


module eightbit
(

input reset,clkin,
input fast,

output reg clkout,
output reg [7:0] counter,
output reg [6:0] clkcounter
);

always@ (posedge clkin) begin 

if (fast) begin
    if (clkcounter== 7'b1100100) begin 
    clkcounter= 7'b0;
    clkout = 1'b1;
end
    else begin
    clkcounter <= clkcounter+1;
    clkout <= 1'b0; 
    end
end

else 
begin
    if (clkcounter== 7'b0011001) begin 
    clkcounter= 7'b0;
    clkout = 1'b1;
    end
    else begin
    clkcounter <= clkcounter+1;
    clkout <= 1'b0; 
    end
end

end  //clkdivider end


always@ (posedge clkout) begin 

if (counter == 8'b1) begin
counter <= counter + 1; 
end

end //always end

endmodule
