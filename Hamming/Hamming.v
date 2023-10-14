`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2023 23:51:06
// Design Name: 
// Module Name: Hamming
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


module Hamming(
    input [3:0] number1,number2,
    output [2:0] value
    );
    wire V1,V2,V3,V4;
    
    xnor(V1,number1[0],number2[0]);
    xnor(V2,number1[1],number2[1]);
    xnor(V3,number1[2],number2[2]);
    xnor(V4,number1[3],number2[3]);
    

    and(value[2],V1,V2,V3,V4);
    
    xor(value[0],V1,V2,V3,V4);
    
    //V4'V2V1 + V4'V3V1 + V4'V3V2 + V4V3'V1 + V4V2V1' + V4V3V2'
    not(nV1,V1);
    not(nV2,V2);
    not(nV3,V3);
    not(nV4,V4);
    wire a1,a2,a3,a4,a5,a6;
    
    and(a1,nV4,V2,V1);
    and(a2,nV4,V3,V1);
    and(a3,nV4,V3,V2);
    and(a4,V4,nV3,V1);
    and(a5,V4,V2,nV1);
    and(a6,V4,V3,nV2);
    
    or(value[1],a1,a2,a3,a4,a5,a6);
    
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2023 23:51:06
// Design Name: 
// Module Name: Hamming
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


module Hamming(
    input [3:0] number1,number2,
    output [2:0] value
    );
    wire V1,V2,V3,V4;
    
    xnor(V1,number1[0],number2[0]);
    xnor(V2,number1[1],number2[1]);
    xnor(V3,number1[2],number2[2]);
    xnor(V4,number1[3],number2[3]);
    

    and(value[2],V1,V2,V3,V4);
    
    xor(value[0],V1,V2,V3,V4);
    
    //V4'V2V1 + V4'V3V1 + V4'V3V2 + V4V3'V1 + V4V2V1' + V4V3V2'
    not(nV1,V1);
    not(nV2,V2);
    not(nV3,V3);
    not(nV4,V4);
    wire a1,a2,a3,a4,a5,a6;
    
    and(a1,nV4,V2,V1);
    and(a2,nV4,V3,V1);
    and(a3,nV4,V3,V2);
    and(a4,V4,nV3,V1);
    and(a5,V4,V2,nV1);
    and(a6,V4,V3,nV2);
    
    or(value[1],a1,a2,a3,a4,a5,a6);
    
endmodule
