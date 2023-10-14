// Code your design here
module swap (
output reg aaa,bbb,
input wire a,b,
input reset,clk

);

  always @ (negedge reset or posedge clk) begin
  if (reset==1'b1) begin
    aaa<=1'b0;
    bbb<=1'b0;
  end
	else 
      begin
      aaa<=b;
      bbb<=a;
      end
end
  
endmodule
