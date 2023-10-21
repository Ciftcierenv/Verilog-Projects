  `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2023 22:39:33
// Design Name: 
// Module Name: function
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
function integer countzeros (input[7:0] a);
integer i;
for (i=0; i<8; i=i+1) begin
if (!a[i]) begin countzeros = countzeros+1; end
end

endfunction

module func(
    output reg [3:0] result
    
    );
    reg [7:0]a;

    initial begin
    a=8'b00101101;
    
    result = countzeros(a);
    
    $display ("Islemin sonucu: %d",result);
    $finish;
    
    end
endmodule
