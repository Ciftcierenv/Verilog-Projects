`timescale 1ns/1ps

module shiftreg (
input wire enable,reset,clk,
input [7:0] din,
output reg dout
);
reg [7:0] A;

always@ (posedge clk) begin
if (reset) begin
    A <= 8'b0;
end
else if (enable) begin
dout <= A[0];
A <= {1'b0,A[7:1]};

end


end

endmodule

module FSM (
input clk,resetn,start,
output reg reset,enable,load
);
always@ (posedge clk) begin
if (resetn) begin reset <= 1'b1; end
else if (start) begin enable <=1'b1; load <=1'b1; end
end

endmodule

module fulladder (
output elde,
input a,b,cin,
output wire sum
);

assign sum = a ^ b ^ cin;
assign elde = (b & cin) | (a & cin) | (a & b);
endmodule

module flip_flop (

input wire clk,reset,
input wire D,
output wire  Q

);
reg qreg;
always@ (posedge clk) begin
if (reset) begin qreg <= 1'b0; end
else begin qreg <= D; end


end
assign Q=qreg;
endmodule

module sumregister (
output [8:0] dout,
input wire enable,sum,reset

);
integer i;
reg [8:0] shiftreg;
always@ (*) begin 
    if (reset) begin shiftreg = 9'b0; end
    else begin
    for (i=0; i<7; i=1+1) begin
    
    shiftreg[i] <= sum; 
    
    end
    end //else end
end
endmodule


module serialadder (
input [7:0] A,B,
input clk,resetn,start,
output [8:0] sum,
output wire elde,sum_out,reset,
output wire load,enable 

);
genvar i;
for (i=0; i<8; i=i+1) begin
wire aout, bout,cout;
FSM control (
.resetn(resetn),
.reset(reset),
.load(load),
.enable(enable),
.start(start),
.clk(clk)
);

shiftreg shiftrega (
.din(A),
.dout(aout),
.clk(clk),
.reset(reset),
.enable(enable)
);

shiftreg shiftregb (
.din(B),
.dout(bout),
.clk(clk),
.reset(reset),
.enable(enable)
);

fulladder adder (
.cin(elde),
.a(aout),
.b(bout),
.sum(sum_out),
.elde(cout)
);

flip_flop flop (
.clk(clk),
.reset(reset),
.D(elde),
.Q(cin)
);


sumregister sumshift(
.dout(sum),
.enable(enable),
.sum(sumout),
.reset(reset)

);
end

endmodule

/*module serialadder(
input [7:0] A,B,
input clk,resetn,start,
output reg[8:0] sum,
output wire a0,b0,
output reg elde,sum_out,reset,
output reg load,enable 
);

always@ (posedge clk) begin

reset <=resetn;
load<=start;
enable<=start;

end

assign a0 = A[0];
assign b0 = B[0];
reg [7:0] Areg,Breg;
integer i;



always@(posedge clk) begin 
Areg<= A;
Breg <= B;

if (reset) begin
//Areg<=8'b0;
//Breg <=8'b0;
load<=1'b0;
enable<=1'b0;
sum<=9'b0;
sum_out <= 1'b0;
elde <= 1'b0;
end
//if reset == 1'b1

else begin


//sum_out<= (a0^b0);
//elde <= (a0 && b0);

//sum [0] <= sum_out;


Areg<={load, Areg[7:1]} ;
Breg <= {load, Breg[7:1]} ;  // shift register A,B
$display ("A=%b areg =%b, Breg =%b, B = %b, load=%b",Areg,A,Breg,B,load);

for (i=0; i<8; i=i+1) begin 

sum_out <= (Areg[i]^Breg[i]^elde);
elde <= (Areg[i] && Breg[i]) | (Areg[i] && elde) | (Breg[i] && elde);
sum[i+1]<= sum_out;
//$display ("sum_out[%d]=%d    Areg=%b  Breg=%b   elde=%d",i,sum_out,Areg,Breg,elde); 

end // for loop end


end //else block end


end //always block end

endmodule*/
