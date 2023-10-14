`timescale 10ns / 1ps
// decrease clk time from 10 ms to 10 ns

module eightbittb(

output clkout,
output reg [7:0] counter,
output reg [6:0] clkcounter
);
reg reset,clkin,fast;

eightbit uut(
.reset(reset),
.clkin(clkin),
.fast(fast),
.clkout(clkout),
.clkcounter(clkcounter)
);

always begin

#1 clkin = ~clkin;

end

initial begin

reset= 0;
clkin=0;
fast=0;

#500;

reset = 1;

#50;

reset=0;
fast=1;

#1000;



$finish;
end

endmodule
