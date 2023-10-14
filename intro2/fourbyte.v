module fourbyte(
input [31:0] fourbyte,
wire [7:0] byte1,byte2,byte3,byte4,
output [31:0] reversed        
    );
    
    assign byte1=fourbyte[7:0];
    assign byte2=fourbyte[15:8];
    assign byte3=fourbyte[23:16];
    assign byte4=fourbyte[31:24];

    assign reversed[31:24]=byte1;
    assign reversed[23:16]=byte2;
    assign reversed[15:8]=byte3;
    assign reversed[7:0]=byte4;
    
endmodule
