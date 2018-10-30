/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module boole16_4 (
    input [15:0] a,
    input [15:0] b,
    input [4:0] alufn,
    output reg [15:0] out
  );
  
  
  
  always @* begin
    out = 1'h0;
    
    case (alufn)
      5'h12: begin
        out = a & b;
      end
      5'h13: begin
        out = ~(a & b);
      end
      5'h14: begin
        out = a | b;
      end
      5'h15: begin
        out = ~(a | b);
      end
      5'h16: begin
        out = a ^ b;
      end
      5'h17: begin
        out = a;
      end
    endcase
  end
endmodule
