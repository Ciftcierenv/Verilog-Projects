`timescale 1ns / 1ps


module sequence(

input wire clk,reset,
output reg [63:0]num0,num1,num2,num3,num4

// 0,1,1,1,2,2,3,4,5,7,9,12,16,21,28,37,49,65,86,114,151,200 n4=n3+n0
// 0,1,2,3,4,0,1,2,3,4
);

always@ (posedge clk or posedge reset) begin
if(reset | num1==16'b0) begin
     num0<=64'b0;
     num1<=64'b0000000000000001;
     num2<=64'b0000000000000001;
     num3<=64'b0000000000000001;
     num4<=64'b0000000000000010;
end
    else begin
    
    num0 <= num1;
    num1 <= num2;
    num2 <= num3;
    num3 <= num4;
    num4 <= num4+num0;
   
    end
end



endmodule
