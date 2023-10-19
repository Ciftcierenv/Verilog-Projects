`timescale 1ns/1ps

//S0 --> 0 ise aynı durumda kal, 1 ise s1'e geç
//S1 --> 0 ise S2'ye geç, 1 ise aynı yerde kal
//S2 --> 0 ise S0'a geç, 1 ise S3'e geç
//S3 --> 0 ise S2'ye geç, 1 ise S1'e geç ve d_out'u 1 yap 


module mealy(

input d_in,
input wire clk,reset,
output reg d_out,
reg[3:0] states,nextstate

);
parameter S0 = 4'h1;
parameter S1 = 4'h2;
parameter S2 = 4'h3;
parameter S3 = 4'h4;

always@(posedge clk or posedge reset) begin 
    
    if (reset) begin 
        states<=S0;
        d_out <= 1'b0;
        
    end
    else begin states <=nextstate; end
    
    end
    
    
    
    always@ (states or d_in) begin
    case (states) 
    S0: begin
        if (d_in) begin nextstate <= S1; end 
        else begin nextstate <= S0; end
    end //2'b00 end
    
    S1: begin
        if (d_in) begin nextstate <= S1; end 
        else begin nextstate <= S2; end
    end//2'b01 end
    
    S2: begin
        if (d_in) begin nextstate <= S3; end 
        else begin nextstate <= S0; end
    
    end//2'b10 end
    
    S3: begin
        if (d_in) begin nextstate <= S1; d_out<=1'b1; end 
        else begin nextstate <= S2; end
   
    end //2'b11 end
    
    
    
    endcase

end //always block end



endmodule
