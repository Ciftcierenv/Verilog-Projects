module chip (
 input wire p1a,p1b,p1c,p1d,p1e,p1f,p2a,p2b,p2c,p2d,
 
 output wire p1y,p2y
);
  wire p2ab=p2a & p2b;
  wire p1abc= p1a & p1b & p1c;
  wire p2cd= p2c & p2d;
  wire p1def = p1d & p1e & p1f;
  
  assign p1y = p1ab | p1def;
  assign p2y = p2cd | p2ab;
  
  
  
endmodule

