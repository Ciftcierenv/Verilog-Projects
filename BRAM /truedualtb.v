`timescale 1ns/1ps


module truedualtb (


);

reg clk;
reg wrena;
reg wrenb;
reg rdena;
reg rdenb;
reg [9:0] addra;
reg [9:0] addrb;
reg [15:0] dina;
reg [15:0] dinb;
wire [15:0] douta;
wire [15:0] doutb;


truedual uut(

.clk(clk),
.wrena(wrena),
.wrenb(wrenb),
.rdena(rdena),
.rdenb(rdenb),
.addra(addra),
.addrb(addrb),
.dina(dina),
.dinb(dinb),
.douta(douta),
.doutb(doutb)
);

always begin #5 clk=~clk; end
initial begin

clk=0;
wrena=0; wrenb=0; rdena=0; rdenb=0;

#50
wrena=1; 
addra=1; addrb=0; dina=16'hFF; dinb=16'hBB;

#50

wrenb=1; rdenb=1;
addra=0; addrb=1; dina = 16'hCD; dinb= 16'hAA;

#50

wrenb=1; rdenb=1; wrena=1; rdena=1;
addra =5; addrb=5; dina = 16'h66; dinb= 16'h77;

#50

wrenb=0; rdenb=1; wrena=1; rdena=0;
addra =6; addrb=6; dina = 16'h66; dinb= 16'h77;

#50

wrenb=1; rdenb=0; wrena=0; rdena=1;
addra =7; addrb=7; dina = 16'h66; dinb= 16'h77;


$finish;
end
endmodule
