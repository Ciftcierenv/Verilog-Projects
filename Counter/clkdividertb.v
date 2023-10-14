`timescale 1ns / 1ps


module clkdividertb (

output wire clkout,
output wire [3:0] counter

);
reg [1:0] freq;
reg clkin,reset;

clkdivider uut (
.freq(freq),
.clkin(clkin),
.reset(reset),
.clkout(clkout),
.counter(counter)

);

always begin
#10;

clkin = ~clkin;

end


initial begin


freq = 2'b00;
clkin=0;
reset = 0;
#50;

reset = 1;

#10;
reset = 0;

#80;
freq = 2'b01;

#150;
freq = 2'b10;


#300;
freq = 2'b11;

#700
$finish;
end


endmodule
