`timescale 1ns / 1ps



module clkdivider (

input [1:0] freq,
input wire clkin,reset,
output reg clkout,
reg [3:0] counter
);


always@(posedge clkin) begin
counter <=4'b0;
if (reset) begin 
counter <= 4'b0;
clkout <= 1'b0;
end
else begin

if (freq==2'b00) begin
    if (counter==4'b0001) begin
    clkout = 1'b1;
    counter <= 4'b0;
    end
    else begin
    counter <= counter + 1;
    clkout = 1'b0;
    end
end

if (freq==2'b01) begin
    if (counter==4'b0011) begin
    clkout = 1'b1;
    counter <= 4'b0;
    end
    else begin
    counter <= counter + 1;
    clkout = 1'b0;
    end
end

if (freq==2'b10) begin
    if (counter==4'b0111) begin
    clkout = 1'b1;
    counter <= 4'b0;
    end
    else begin
    counter <= counter + 1;
    clkout = 1'b0;
    end
end

if (freq==2'b11) begin
    if (counter==4'b1111) begin
    clkout = 1'b1;
    counter <= 4'b0;
    end
    else begin
    counter <= counter + 1;
    clkout = 1'b0;
    end
end


end //else block end
end //always end



endmodule
