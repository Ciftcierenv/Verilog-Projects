// Code your design here
module vectorbreakdown(

  input [2:0] vector,
  output [2:0] outv,
  output o0,o1,o2
  
);
  
  assign outv = vector;
  assign o0 = vector[0];
  assign o1 = vector[1];
  assign o2 = vector[2];
  
  
  
  endmodule
