`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2023 20:04:03
// Design Name: 
// Module Name: N-bit_adder
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


module Nbit_adder(
        input [n-1:0] V1,V2,    // Value1, Value2
        input cin,              // Giren elde
        output [n:0] sum,       // xor(sum,V1,V2)
        output cout             // İşlem sonu çıkan elde
        
    );
    parameter n = 4;
    wire [n:0] c;
    
    genvar x;
    
    generate        //modulleri oluşturma 
        
        for (x=0; x<n; x=x+1) begin : Full_adders
           Full_adder bit(
           
            .A (V1[x]),                                                 //Değişkenleri tanımlama
            .B (V2[x]),
            .cin (c[x]),
            .cout (c[x+1]),
            .sum (sum[x])
            );
        end
        
        endgenerate
        
        
        assign cin = c[0];              //   ilk elde atanır, işlem doğruluğu için
        assign cout = c[n];             //   diğer eldeler atanır ""    ""     ""
    
 
 
    
endmodule
